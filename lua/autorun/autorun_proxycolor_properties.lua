
//loads the context menu addition in the child folder, doesnt auto load without this!
include( "properties/proxycolor_properties.lua" )



//BELOW IS SETTING UP GLOBAL WHATNOT

if SERVER then
	util.AddNetworkString("SendToEntityClient")
end

net.Receive("SendToEntityClient",function()
	
	local Entity = net.ReadEntity()
	local NetworkedTable = net.ReadTable()
	

	local cs1 = NetworkedTable[1][1] 
	local cs2 = NetworkedTable[1][2] 
	local cs3 = NetworkedTable[1][3] 
	local cs4 = NetworkedTable[1][4] 
	local cs5 = NetworkedTable[1][5] 
	local cs6 = NetworkedTable[1][6] 
	
	
	-- print(Entity) //doesnt network if duped tffffffffffffffffffffffffffff
	
	if ( Entity.ColorSlot1 ) then 
		local cs1 = Vector(cs1.r/255,cs1.g/255,cs1.b/255)
		Entity.ColorSlot1 = function() return cs1 end
	end
	if ( Entity.ColorSlot2 ) then		
		local cs2 = Vector(cs2.r/255,cs2.g/255,cs2.b/255)
		Entity.ColorSlot2 = function() return cs2 end
	end
	if ( Entity.ColorSlot3 ) then		
		local cs3 = Vector(cs3.r/255,cs3.g/255,cs3.b/255)
		Entity.ColorSlot3 = function() return cs3 end
	end
	if ( Entity.ColorSlot4 ) then		
		local cs4 = Vector(cs4.r/255,cs4.g/255,cs4.b/255)
		Entity.ColorSlot4 = function() return cs4 end
	end
	if ( Entity.ColorSlot5 ) then		
		local cs5 = Vector(cs5.r/255,cs5.g/255,cs5.b/255)
		Entity.ColorSlot5 = function() return cs5 end
	end
	if ( Entity.ColorSlot6 ) then		
		local cs6 = Vector(cs6.r/255,cs6.g/255,cs6.b/255)
		Entity.ColorSlot6 = function() return cs6 end
	end
	
end)


-- hook.Add( "OnEntityCreated", "proxycolor_server_entspawn", function(ent) 

	-- if CLIENT then
		
	-- end

	-- if SERVER then
		-- ent.ColorSlot1 = function() return Vector(1,1,1) end
	-- end

-- end) 



//Set up global function for both tool and context menu as well as anyone that wants to utilize it

-- function GetProxyColors( ent )
	
		-- local ColorTable = {}
		-- if (ent.ColorSelect1) then
			-- table.insert(ColorTable, 1, ColorSelect1:() or Color(255,255,255) )
		-- end
		-- if (ent.ColorSelect2) then
			-- table.insert(ColorTable, 2, ColorSelect2:() or Color(255,255,255) )
		-- if (ent.ColorSelect3) then
			-- table.insert(ColorTable, 3, ColorSelect3:() or Color(255,255,255) )
		-- end
		-- if (ent.ColorSelect4) then
			-- table.insert(ColorTable, 4, ColorSelect4:() or Color(255,255,255) )
		-- end
		-- if (ent.ColorSelect5) then  
			-- table.insert(ColorTable, 5, ColorSelect5:() or Color(255,255,255) )
		-- end
		-- if (ent.ColorSelect6) then
			-- table.insert(ColorTable, 6, ColorSelect6:() or Color(255,255,255) )
		-- end
		
	-- return ColorTable
-- end

function SetProxyColor( Player, Entity, colors, ClientOnly )
	
		if !IsValid(Entity) then return end

		
		if ( Entity.ColorSlot1 ) then 
			local cs1 = Vector(colors[1].r/255,colors[1].g/255,colors[1].b/255)
			Entity.ColorSlot1 = function() return cs1 end
		end
		if ( Entity.ColorSlot2 ) then		
			local cs2 = Vector(colors[2].r/255,colors[2].g/255,colors[2].b/255)
			Entity.ColorSlot2 = function() return cs2 end
		end
		if ( Entity.ColorSlot3 ) then		
			local cs3 = Vector(colors[3].r/255,colors[3].g/255,colors[3].b/255)
			Entity.ColorSlot3 = function() return cs3 end
		end
		if ( Entity.ColorSlot4 ) then		
			local cs4 = Vector(colors[4].r/255,colors[4].g/255,colors[4].b/255)
			Entity.ColorSlot4 = function() return cs4 end
		end
		if ( Entity.ColorSlot5 ) then		
			local cs5 = Vector(colors[5].r/255,colors[5].g/255,colors[5].b/255)
			Entity.ColorSlot5 = function() return cs5 end
		end
		if ( Entity.ColorSlot6 ) then		
			local cs6 = Vector(colors[6].r/255,colors[6].g/255,colors[6].b/255)
			Entity.ColorSlot6 = function() return cs6 end
		end
		  
		
		// should only send a network thingie when there is no player specified (ONLY SPECIFIED DURING LIVE UPDATING CONTEXT MENU PREVIEW ON CLIENT)
		if ( ClientOnly == nil ) then 
			if SERVER then
				net.Start("SendToEntityClient")
				net.WriteEntity( Entity ) -- this doesnt network wtf
				net.WriteTable({colors})
				net.Broadcast()
				-- net.Send( Player )
				-- print(Entity) --wtf whyyyyyyy 
			end
		end
			
		-- print(Player)

		
		if ( SERVER ) then
			duplicator.StoreEntityModifier( Entity, "proxycolor", colors )
		end
	

end
duplicator.RegisterEntityModifier( "proxycolor", SetProxyColor )

// register the dupe modifier, the function will run and re-add the color on dupe paste


