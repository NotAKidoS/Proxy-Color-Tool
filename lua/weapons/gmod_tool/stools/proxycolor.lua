// Tool by NotAKid, please dont eat my footsies

TOOL.Category		= "Render"
TOOL.Name			= "Proxy Color"


// add each material proxy we support

//	Primary --SWITCHED TO COLORSLOTS
TOOL.ClientConVar[ "cs1_r" ] = 255
TOOL.ClientConVar[ "cs1_g" ] = 255
TOOL.ClientConVar[ "cs1_b" ] = 255
//	Secondary       
TOOL.ClientConVar[ "cs2_r" ] = 255
TOOL.ClientConVar[ "cs2_g" ] = 255
TOOL.ClientConVar[ "cs2_b" ] = 255
					
TOOL.ClientConVar[ "cs3_r" ] = 255
TOOL.ClientConVar[ "cs3_g" ] = 255
TOOL.ClientConVar[ "cs3_b" ] = 255
					
TOOL.ClientConVar[ "cs4_r" ] = 255
TOOL.ClientConVar[ "cs4_g" ] = 255
TOOL.ClientConVar[ "cs4_b" ] = 255
					
TOOL.ClientConVar[ "cs5_r" ] = 255
TOOL.ClientConVar[ "cs5_g" ] = 255
TOOL.ClientConVar[ "cs5_b" ] = 255
					
TOOL.ClientConVar[ "cs6_r" ] = 255
TOOL.ClientConVar[ "cs6_g" ] = 255
TOOL.ClientConVar[ "cs6_b" ] = 255

TOOL.CurEntity = nil

// Add the language overrides
if CLIENT then
	language.Add("proxycolor", "Proxy Color")
	language.Add("tool.proxycolor.name", "Proxy Color")
	language.Add("tool.proxycolor.desc", "Set colors for a supported object")
	language.Add("tool.proxycolor.Color multiplier.help", "Easy shade/intensity")
	-- language.Add("tool.proxycolor.0", "Apply the colors")
	language.Add("tool.proxycolor.reload", "Reset color scheme")-----------
	language.Add("tool.proxycolor.right", "Copy color scheme") ---------- |
	language.Add("tool.proxycolor.left", "Select AND THEN color object")--------- | |
	-- language.Add("tool.proxycolor.left_1", "Apply color scheme")   --   | | |
																 --   | | |
end																 --   | | |
// Tool info on the top left of the screen when holding the tool --   | | | // They make those work, the Information is set and the language thing changes the text
TOOL.Information = {											 --	  | | |
	{ name = "left", stage = 0}, ------------------------------------------------ | |
	-- { name = "left_1", stage = 1 }, ------------------------------------------------ | |
	-- { name = "right" }, ------------------------------------------------  |
	{ name = "reload" } --------------------------------------------------
} -- This is used to display the buttons/keys the tool uses in the top left

// Actual toolgun code


function TOOL:LeftClick( trace )

	local ent = trace.Entity
	if ( IsValid( ent.AttachedEntity ) ) then ent = ent.AttachedEntity end // I honestly dont know what this means, it was a part of the normal color tool
	
	// if the entity is a Simfphys wheel, set the fake Ghost wheel as the selected entity (the ghostwheel is the visual one)
	if ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then 
		ent = ent:GetChildren()[2] // This will color Simfphys wheels now, even if they arent saved by Simfphys icle Dupe :<
	end

	if IsValid( ent ) then -- The entity is valid and isn't worldspawn
	
		if self:GetWeapon():GetNWEntity("CurEntity") != ent then
			self:GetWeapon():SetNWEntity("CurEntity",ent)

			self:GetWeapon():EmitSound( "garrysmod/content_downloaded.wav", 75, 100, 1, CHAN_WEAPON)
			-- Entity(1):PrintMessage(HUD_PRINTTALK, "[Proxy Color] Rebuilt panel, check your menu!")

			return
		end
		
		
		if ( CLIENT ) then return true end
		
		
		local ColorTable = {}

		for i=1,6 do
			local cs_r		= self:GetClientNumber( "cs"..i.."_r", 0 )
			local cs_g	= self:GetClientNumber( "cs"..i.."_g", 0 )
			local cs_b	= self:GetClientNumber( "cs"..i.."_b", 0 )
			table.insert(ColorTable, i, Color(cs_r,cs_g,cs_b) )
		end
		
		SetProxyColor( nil, ent, ColorTable )


		return true
		
	end
	
end


function TOOL:RightClick( trace )

	local ent = trace.Entity
	if ( IsValid( ent.AttachedEntity ) ) then ent = ent.AttachedEntity end // I honestly dont know what this means, it was a part of the normal color tool

	
	// if the entity is a Simfphys wheel, set the fake Ghost wheel as the selected entity (the ghostwheel is the visual one)
	if ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then 
		ent = ent:GetChildren()[2]
	end

	if IsValid( ent ) then -- The entity is valid and isn't worldspawn
		
		-- if CLIENT then
			-- print(self.ColorSlot1)
		-- end
		-- checkthing(ent) 
		
		-- if ( ent.ColorSlot1 ) then 
			-- local cs = ent:ColorSlot1() or Color(255,255,255)
			-- self:GetOwner():ConCommand( "cs1_r " .. cs.r*255 )
			-- self:GetOwner():ConCommand( "cs1_g " .. cs.g*255 )
			-- self:GetOwner():ConCommand( "cs1_b " .. cs.b*255 )
			-- print(cs)
		-- end
			
		-- if ( ent.ColorSlot2 ) then 
			-- local cs = ent:GetSecondaryProxy() or Color(255,255,255)
			-- self:GetOwner():ConCommand( "cs2_r " .. cs.r*255 )
			-- self:GetOwner():ConCommand( "cs2_g " .. cs.g*255 )
			-- self:GetOwner():ConCommand( "cs2_b " .. cs.b*255 )
		-- end


		return true
	
	end
	
end

function TOOL:Reload( trace )

	local ent = trace.Entity
	if ( IsValid( ent.AttachedEntity ) ) then ent = ent.AttachedEntity end // I honestly dont know what this means, it was a part of the normal color tool

	// if the entity is a Simfphys wheel, set the fake Ghost wheel as the selected entity (the ghostwheel is the visual one)
	if ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then // resets simfphys vehicle wheel colors
		ent = ent:GetChildren()[2]
	end

	if IsValid( ent ) then -- The entity is valid and isn't worldspawn

		local ColorTable = {}

		for i=1,6 do
			table.insert(ColorTable, i, Color(255,255,255) )
		end
		
		SetProxyColor( nil, ent, ColorTable )

		return true
	
	end
	
end

function TOOL:Think()

	if CLIENT then
		
		local netEnt = self:GetWeapon():GetNWEntity("CurEntity")
		
		if (netEnt == self.CurEntity) then
		
		else
			self.CurEntity = self:GetWeapon():GetNWEntity("CurEntity")

			self:UpdateControlPanel()
		end
	end
end

// END OF TOOLS FUNCTIONS
// TOOL GUNS MENU BELOW


//holy shit thank you joint tool guy i love you i kiss you with my cats tounge
//this just blew my mind, i needed this so bad
function TOOL:UpdateControlPanel()
	local CPanel = controlpanel.Get( "proxycolor" )
	if ( !CPanel ) then Msg("Couldn't find proxycolor panel!\n") return end
		
	CPanel:ClearControls()
	self.BuildCPanel( CPanel, self.CurEntity )
	-- print("unwaaa")
end



local function HackyListGenThingIdk(i,Selected,CPanel,ColorSlotNames)

	-- print(i)

	local name = (ColorSlotNames[i]) or "Color Slot "..i.." (no name set in vmt file!)"
	
	//-- CREATES THE COLLAPSABLE PART OF THE MENU, NAMES IT THE MATERIALS NAME
	local collapse = vgui.Create("DCollapsibleCategory")
	collapse:SetLabel(name)
	
	CPanel:AddItem(collapse) //adds the collapsable part of the menu to the panel
	
	//-- A (no longer) TEMP LIST TO PARENT TO
	
	local list = vgui.Create("DPanelList",collapse)
	list:SetHeight(250)
	list:SetPadding(10)
	-- function list:Paint()
		-- draw.RoundedBox(8,0,0,self:GetWide(),self:GetTall(),Color(160,160,160,255))
	-- end
	list:Dock(TOP)
	collapse:InvalidateLayout(true)
	//--CREATES THE COLOR MIXER PART OF THE MENU, PARENTS TO THE NEW COLLAPBABLE PART OF THE MENU
	local ColorSlot = vgui.Create( "DColorMixer" )
	ColorSlot:SetLabel(name)
	ColorSlot:SetPalette( true )
	ColorSlot:SetAlphaBar( false ) 
	ColorSlot:SetWangs( true )
	ColorSlot:SetConVarR("proxycolor_cs"..i.."_r")
	ColorSlot:SetConVarG("proxycolor_cs"..i.."_g")
	ColorSlot:SetConVarB("proxycolor_cs"..i.."_b")
	list:AddItem(ColorSlot)
	
	collapse:SetExpanded(true)
end

local ConVarsDefault = TOOL:BuildConVarList() // used to get the saved presets
function TOOL.BuildCPanel( CPanel, Selected ) // the control area of the tool, gonna have to work on it to make multiple proxies easier to use


	CPanel:AddControl( "Header", { Description = "#tool.proxycolor.desc" } )

	CPanel:AddControl( "ComboBox", { MenuButton = 1, Folder = "proxycolor", Options = { [ "#preset.default" ] = ConVarsDefault }, CVars = table.GetKeys( ConVarsDefault ) } )
	
	if !Selected then return end
	
	// DERMA BASED TOOL PANEL
	local ColorSlotNames = {Selected.ColorSlot1Name,Selected.ColorSlot2Name,Selected.ColorSlot3Name,Selected.ColorSlot4Name,Selected.ColorSlot5Name,Selected.ColorSlot6Name}


	//holy shit thats so much faster than for loops
	if ( Selected.ColorSlot1 ) then HackyListGenThingIdk(1,Selected,CPanel,ColorSlotNames) end
	if ( Selected.ColorSlot2 ) then HackyListGenThingIdk(2,Selected,CPanel,ColorSlotNames) end
	if ( Selected.ColorSlot3 ) then HackyListGenThingIdk(3,Selected,CPanel,ColorSlotNames) end
	if ( Selected.ColorSlot4 ) then HackyListGenThingIdk(4,Selected,CPanel,ColorSlotNames) end
	if ( Selected.ColorSlot5 ) then HackyListGenThingIdk(5,Selected,CPanel,ColorSlotNames) end
	if ( Selected.ColorSlot6 ) then HackyListGenThingIdk(6,Selected,CPanel,ColorSlotNames) end

end
