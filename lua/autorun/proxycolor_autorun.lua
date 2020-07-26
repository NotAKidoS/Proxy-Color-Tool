--[[
	this code is prolly shit i know
	if you want to help improve it then contribute on the github repo!
]]

ProxyColor = true

local Entity = FindMetaTable( "Entity" )

--Function to return the color table
function Entity:GetProxyColor()
	if !IsValid(self) then return end
	return self.ColorTable
end

--Function to set color table
function Entity:SetProxyColor(ColorTable)
	if !IsValid(self) or !ColorTable then return end
	
	for i=1,6 do
		if IsColor(ColorTable[i]) then ColorTable[i] = ColorTable[i]:ToVector() end
	end

	self.ColorTable = ColorTable --store colortable on server

	--Store dupe data whatnot
	if ( CLIENT ) then
		net.Start("NAKProxyColorSync")--network to player (unsure if this will work yet, maybe used for clientside derma menu preview)
		net.WriteEntity(self)
		net.WriteTable(ColorTable)
		net.Send(LocalPlayer())
	else
		net.Start("NAKProxyColorSync")--network to players
		net.WriteEntity(self)
		net.WriteTable(ColorTable)
		net.Broadcast()
		duplicator.StoreEntityModifier( self, "proxycolor", ColorTable )
	end
end

--Function to set color table for dupes
function DupeSetProxyColor( ply, ent, CT )
	--client needs to know of the entitys existence before networking happens THIS WILL FAIL IF PING IS TOO HIGH
	if game.SinglePlayer() then
		ent:SetProxyColor( CT )
	else
		ply:PrintMessage(HUD_PRINTTALK, "[Proxy Color] Players with high ping may not have proxy colors networked, please re-apply them if possible!")
		timer.Simple( 1, function() ent:SetProxyColor( CT ) end )
	end
end
duplicator.RegisterEntityModifier( "proxycolor", DupeSetProxyColor )

--Networking pp stuff
if SERVER then
	util.AddNetworkString("NAKProxyColorSync")
else
	net.Receive("NAKProxyColorSync",function()
		local self = net.ReadEntity()
		local CT = net.ReadTable()
		self.ColorTable = CT
		if CT[1] != nil then self.ColorSlot1 = CT[1] end
		if CT[2] != nil then self.ColorSlot2 = CT[2] end
		if CT[3] != nil then self.ColorSlot3 = CT[3] end
		if CT[4] != nil then self.ColorSlot4 = CT[4] end
		if CT[5] != nil then self.ColorSlot5 = CT[5] end
		if CT[6] != nil then self.ColorSlot6 = CT[6] end
	end)
end