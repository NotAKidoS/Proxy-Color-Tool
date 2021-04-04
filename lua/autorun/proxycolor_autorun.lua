--[[
	this code is prolly shit I know
	if you want to help improve it then contribute on the github repo!
]]
ProxyColor = istable( ProxyColor ) and ProxyColor or {}

if SERVER then
	AddCSLuaFile("matproxy/matproxycolors.lua")
	AddCSLuaFile("weapons/gmod_tool/stools/proxycolor.lua")
	print("[Proxy Color] Added files to CLIENT.")
end
if CLIENT then
	include("matproxy/matproxycolors.lua") -- enforce run CLIENT side
	--include("weapons/gmod_tool/stools/proxycolor.lua")
	print("[Proxy Color] started.")
end

local Entity = FindMetaTable( "Entity" )

--Function to return the color table
function Entity:GetProxyColor()
	if !IsValid(self) then return end
	return self.ColorTable
end

--Function to set color table
function Entity:SetProxyColor(ColorTable)
	if !IsValid(self) or !ColorTable then return end
	
	for i=1,7 do
		if IsColor(ColorTable[i]) then ColorTable[i] = ColorTable[i]:ToVector() end
	end

	self.ColorTable = ColorTable --store colortable on entity (probably needs to be reworked)

	--Store dupe data whatnot
	if ( CLIENT ) then
		if IsValid(self) then
			if ColorTable[1] != nil then self.ColorSlot1 = ColorTable[1] end
			if ColorTable[2] != nil then self.ColorSlot2 = ColorTable[2] end
			if ColorTable[3] != nil then self.ColorSlot3 = ColorTable[3] end
			if ColorTable[4] != nil then self.ColorSlot4 = ColorTable[4] end
			if ColorTable[5] != nil then self.ColorSlot5 = ColorTable[5] end
			if ColorTable[6] != nil then self.ColorSlot6 = ColorTable[6] end
			if ColorTable[7] != nil then self.ColorSlot7 = ColorTable[7] end
		end
	else
		local entID = self:EntIndex()
		if entID == -1 then
			print("[Proxy Color] Attempted to network a server/clientside ONLY entity, refusing to send. https://bit.ly/2OY7Nyj")
			print("[Proxy Color] If you believe this is a mistake or useless check, please contact me on steam. -NotAKid")
		else
			net.Start("NAKProxyColorSync") --network to players
			net.WriteFloat(self:EntIndex())
			net.WriteTable(ColorTable)
			net.Broadcast()
		end
		duplicator.StoreEntityModifier( self, "proxycolor", ColorTable )
	end
end

--Function to set color table for dupes
local function DupeSetProxyColor( ply, ent, CT )
	ent:SetProxyColor( CT )
end
duplicator.RegisterEntityModifier( "proxycolor", DupeSetProxyColor )

--Networking pp stuff
if SERVER then
	util.AddNetworkString("NAKProxyColorSync")
else
	net.Receive("NAKProxyColorSync",function()
		local entID = net.ReadFloat()
		local CT = net.ReadTable()
		local TimerName = "PrxyClr_"..entID

		--Check if the entity exists a few times
		timer.Create(TimerName, 0.01, 12, function(a,b)
			local self = ents.GetByIndex( entID )
			if IsValid(self) then 
				timer.Remove(TimerName)
				self.ColorTable = CT
				if CT[1] != nil then self.ColorSlot1 = CT[1] end
				if CT[2] != nil then self.ColorSlot2 = CT[2] end
				if CT[3] != nil then self.ColorSlot3 = CT[3] end
				if CT[4] != nil then self.ColorSlot4 = CT[4] end
				if CT[5] != nil then self.ColorSlot5 = CT[5] end
				if CT[6] != nil then self.ColorSlot6 = CT[6] end
				if CT[7] != nil then self.ColorSlot7 = CT[7] end
			end
			--if the players ping is too high, wait a bit and try again (less timer spam)
			--I tested with net_fakeloss and net_fakelag, no value ever triggered this. Unsure if this is needed but just in case.
			if timer.RepsLeft(TimerName) == 0 then
				print("[Proxy Color] Error receiving entity from server, too high of ping or entity does not exist! Retrying in 3 seconds...")
				timer.Simple( 3, function() 
					local self = ents.GetByIndex( entID )
					if IsValid(self) then
						if !self.ColorTable then
							self.ColorTable = CT
							if CT[1] != nil then self.ColorSlot1 = CT[1] end
							if CT[2] != nil then self.ColorSlot2 = CT[2] end
							if CT[3] != nil then self.ColorSlot3 = CT[3] end
							if CT[4] != nil then self.ColorSlot4 = CT[4] end
							if CT[5] != nil then self.ColorSlot5 = CT[5] end
							if CT[6] != nil then self.ColorSlot6 = CT[6] end
							if CT[7] != nil then self.ColorSlot7 = CT[7] end
							print("[Proxy Color] Entity received, proxy colors have been set!")
						else
							print("[Proxy Color] Entity received, existing proxy colors found. Ignoring original colors...")
						end
					else
						print("[Proxy Color] Entity failed to network, something may be missing its proxy colors for you. *THIS SHOULD NEVER HAPPEN ;-;*")
					end
				end )
			end
		end )
	end)
end

-- useful functions
-- spawnonly mainly means it wont recolor if it already has a color (aka when duplicated)
function ProxyColor.RandFromTable( ent, ctable, spawnonly )
	if spawnonly and ent.ColorTable then return end
	ent:SetProxyColor(ctable[math.random(1, #ctable)])
end
function ProxyColor.Random( ent, spawnonly )
	if spawnonly and ent.ColorTable then return end
	local ColorTable = {}
	for i=1,7 do
		local vect = VectorRand( 0, 255 )
		vect:Normalize()
		table.insert(ColorTable, i, vect:ToColor() )
	end
	ent:SetProxyColor( ColorTable )
end