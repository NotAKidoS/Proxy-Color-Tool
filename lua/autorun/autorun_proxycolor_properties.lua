
//loads the context menu addition in the child folder, doesnt auto load without this!
-- include( "properties/proxycolor_properties.lua" )


//BELOW IS SETTING UP GLOBAL WHATNOT

ProxyColor = true


if SERVER then
	util.AddNetworkString("NAKProxyColorSync")
end

net.Receive("NAKProxyColorSync",function()
	
	local ent = net.ReadEntity()
	local NT = net.ReadTable()
	
	ent.GetProxyColor = function() return NT end
	
	if ent.ColorSlot1 then
		ent.ColorSlot1 = function() return NT[1] end
	end
	if ent.ColorSlot2 then
		ent.ColorSlot2 = function() return NT[2] end
	end
	if ent.ColorSlot3 then
		ent.ColorSlot3 = function() return NT[3] end
	end
	if ent.ColorSlot4 then
		ent.ColorSlot4 = function() return NT[4] end
	end
	if ent.ColorSlot5 then
		ent.ColorSlot5 = function() return NT[5] end
	end
	if ent.ColorSlot6 then
		ent.ColorSlot6 = function() return NT[6] end
	end
end)

local Entity = FindMetaTable( "Entity" )

local function NWProxyColor( Entity, ColorTable )
	if !IsValid(Entity) then return end

	net.Start("NAKProxyColorSync")
	net.WriteEntity( Entity )
	net.WriteTable(ColorTable)
	net.Broadcast()
end

function DupeSetProxyColor( Player, Entity, ColorTable )
	Entity:SetProxyColor( ColorTable )
end

function Entity:SetProxyColor( ColorTable )
	if !IsValid(self) then return end

	for i=1,6 do
		if IsColor(ColorTable[i]) then ColorTable[i] = ColorTable[i]:ToVector() end
	end
	
	self.GetProxyColor = function() return ColorTable end

	NWProxyColor( self, ColorTable )
	
	if ( SERVER ) then
		duplicator.StoreEntityModifier( self, "proxycolor", ColorTable )
	end
end
duplicator.RegisterEntityModifier( "proxycolor", DupeSetProxyColor )



