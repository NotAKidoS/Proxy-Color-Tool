
AddCSLuaFile()

-- The respray panel, should hopefully allow colorssss
-- local ResprayMenu = nil
local Frame

local function ResprayMenu(self,ent)
 
	local vehmodel
	if simfphys.IsCar(ent) then
		local v_list = list.Get( "simfphys_vehicles" )
		local listname = ent:GetSpawn_List()

		vehmodel = v_list[listname].Model
		local simfphys = true
	else
		vehmodel = ent:GetModel()
	end

	-- print(listname) 

	local frame = vgui.Create( "DFrame" )
	frame:SetSize( ScrW() / 1.5, ScrH() / 1.5 )
	frame:SetTitle( tostring( ent ) )
	frame:Center()
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:SetScreenLock( false )
	frame:ShowCloseButton( true )
	frame:Center()
	frame:MakePopup()
	frame:SetKeyboardInputEnabled( false )

	local ColorSlotNames = {ent.ColorSlot1Name,ent.ColorSlot2Name,ent.ColorSlot3Name,ent.ColorSlot4Name,ent.ColorSlot5Name,ent.ColorSlot6Name}


	local LeftPanel = vgui.Create( "DPanel", frame ) -- Can be any panel, it will be stretched
	local RightPanel = vgui.Create( "DPanel", frame )

	local div = vgui.Create( "DHorizontalDivider", frame )
	div:Dock( FILL ) -- Make the divider fill the space of the DFrame
	div:SetLeft( LeftPanel ) -- Set what panel is in left side of the divider
	div:SetRight( RightPanel )
	div:SetDividerWidth( 4 ) -- Set the divider width. Default is 8
	div:SetLeftMin( 20 ) -- Set the Minimum width of left side
	div:SetRightMin( 20 )
	div:SetLeftWidth( ScrW() / 2.45 ) -- Set the default left side width

	local DScrollPanel = vgui.Create( "DScrollPanel", RightPanel )
	DScrollPanel:Dock( FILL )



	local ColorSelect1 = vgui.Create( "DColorMixer", frame )
	ColorSelect1:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect1:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect1:SetPalette( true )
	ColorSelect1:SetAlphaBar( false ) 
	ColorSelect1:SetWangs( true )
	ColorSelect1:Dock( TOP )
	ColorSelect1:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect1 )
	
	local ColorSelect2 = vgui.Create( "DColorMixer", frame )
	ColorSelect2:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect2:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect2:SetPalette( true )
	ColorSelect2:SetAlphaBar( false ) 
	ColorSelect2:SetWangs( true )
	ColorSelect2:Dock( TOP )
	ColorSelect2:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect2 )
	
	local ColorSelect3 = vgui.Create( "DColorMixer", frame )
	ColorSelect3:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect3:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect3:SetPalette( true )
	ColorSelect3:SetAlphaBar( false ) 
	ColorSelect3:SetWangs( true )
	ColorSelect3:Dock( TOP )
	ColorSelect3:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect3 )
	
	local ColorSelect4 = vgui.Create( "DColorMixer", frame )
	ColorSelect4:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect4:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect4:SetPalette( true )
	ColorSelect4:SetAlphaBar( false ) 
	ColorSelect4:SetWangs( true )
	ColorSelect4:Dock( TOP )
	ColorSelect4:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect4 )
	
	local ColorSelect5 = vgui.Create( "DColorMixer", frame )
	ColorSelect5:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect5:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect5:SetPalette( true )
	ColorSelect5:SetAlphaBar( false ) 
	ColorSelect5:SetWangs( true )
	ColorSelect5:Dock( TOP )
	ColorSelect5:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect5 )
	
	local ColorSelect6 = vgui.Create( "DColorMixer", frame )
	ColorSelect6:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	ColorSelect6:SetPos( frame:GetWide() - ScrW() * 0.208 - 30, 50)
	ColorSelect6:SetPalette( true )
	ColorSelect6:SetAlphaBar( false ) 
	ColorSelect6:SetWangs( true )
	ColorSelect6:Dock( TOP )
	ColorSelect6:DockMargin( 0, 0, 0, 5 )
	DScrollPanel:AddItem( ColorSelect6 )

	

		
	//	SET THE COLOR MIXERS TO THE ALREADY SET COLORS
	
	if ( ent.ColorSlot1 ) then
		local cs1 = ent:ColorSlot1() or Color(255,255,255)
		ColorSelect1:SetColor( Color(cs1.r*255,cs1.g*255,cs1.b*255,255) )
	else
		ColorSelect1:SetVisible( false )
	end
	if ( ent.ColorSlot2 ) then
		local cs2 = ent.ColorSlot2() or Color(255,255,255)
		ColorSelect2:SetColor( Color(cs2.r*255,cs2.g*255,cs2.b*255,255) )
	else
		ColorSelect2:SetVisible( false )
	end
	if ( ent.ColorSlot3 ) then
		local cs3 = ent.ColorSlot3() or Color(255,255,255)
		ColorSelect3:SetColor( Color(cs3.r*255,cs3.g*255,cs3.b*255,255) )
	else
		ColorSelect3:SetVisible( false )
	end
	if ( ent.ColorSlot4 ) then
		local cs4 = ent.ColorSlot4() or Color(255,255,255)
		ColorSelect4:SetColor( Color(cs4.r*255,cs4.g*255,cs4.b*255,255) )
	else
		ColorSelect4:SetVisible( false )
	end
	if ( ent.ColorSlot5 ) then
		local cs5 = ent.ColorSlot5() or Color(255,255,255)
		ColorSelect5:SetColor( Color(cs5.r*255,cs5.g*255,cs5.b*255,255) )
	else
		ColorSelect5:SetVisible( false )
	end
	if ( ent.ColorSlot6 ) then
		local cs6 = ent.ColorSlot6() or Color(255,255,255)
		ColorSelect6:SetColor( Color(cs6.r*255,cs6.g*255,cs6.b*255,255) )
	else
		ColorSelect6:SetVisible( false )
	end
	
		
	BGPanel = vgui.Create("DPanel", frame)
	BGPanel:SetPos( 30, 50 )
	BGPanel:SetSize( ScrW() * 0.333, ScrH() * 0.5 )
	BGPanel:SetBackgroundColor(Color(12, 41, 82, 255))


	BGPanel.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(255,0,0,100))
	end
	



	local AdjustableModelPanel = vgui.Create( "DMultiModelPanelPCT", BGPanel )
	AdjustableModelPanel:SetPos( side, top )
	AdjustableModelPanel:SetSize( ScrW() * 0.208, ScrH() * 0.277 )
	AdjustableModelPanel:Dock( FILL )
	-- AdjustableModelPanel:SetModel( "models/notakid/gtavredux/ruiner2000/ruiner_2000_main.mdl", 0 )
	-- AdjustableModelPanel:SetModel( vehmodel, 0)

	AdjustableModelPanel:AddModel( vehmodel, "mdl1" )
	AdjustableModelPanel:SetModelPos( "mdl1", Vector(0,0,0) )
	
	-- PrintTable(ent:GetChildren())
	
	for i=1, #ent:GetChildren() do
		local mdlname = "mdl"..i
		AdjustableModelPanel:AddModel( ent:GetChildren()[i]:GetModel(), mdlname )
		AdjustableModelPanel:SetModelPos( mdlname, Vector(0,0,0) )
		
		print(i)
		print(mdlname)
		print(ent:GetChildren()[i])
		
	end

	-- AdjustableModelPanel:CreateAllModels()
	
	-- AdjustableModelPanel:SetMouseInputEnabled( false ) //no mouse cursor hover
	
	
	local bound1, bound4 = ent:GetModelBounds()
	
	-- AdjustableModelPanel:SetLookAt( AdjustableModelPanel.Models["mdl1"]:WorldSpaceCenter() )
	-- AdjustableModelPanel:SetCamPos( bound4 * Vector(2,2,0.5) )
	
	function AdjustableModelPanel:LayoutEntity( Entity )
		
		-- Entity:SetAngles( Angle( 0, RealTime() * 20 % 360, 0 ) )
		-- AdjustableModelPanel:SetModelAng( "mdl1", Angle( 0, RealTime() * 20 % 360, 0 ) )
		
		local ColorTable = {}
		table.insert(ColorTable, 1, ColorSelect1:GetColor() or Color(255,255,255) )
		table.insert(ColorTable, 2, ColorSelect2:GetColor() or Color(255,255,255) )
		table.insert(ColorTable, 3, ColorSelect3:GetColor() or Color(255,255,255) )
		table.insert(ColorTable, 4, ColorSelect4:GetColor() or Color(255,255,255) )
		table.insert(ColorTable, 5, ColorSelect5:GetColor() or Color(255,255,255) )
		table.insert(ColorTable, 6, ColorSelect6:GetColor() or Color(255,255,255) )
		
		
		SetProxyColor( nil, self.Models["mdl1"], ColorTable, LocalPlayer() )
		
	end


	local ConfirmColor = vgui.Create("DButton", frame)
	ConfirmColor:SetText( "Respray!" )
	ConfirmColor:SetSize( 90, 30 )
	ConfirmColor:SetPos( 100, frame:GetTall() - 40 )
	ConfirmColor.DoClick = function()

		local cs1 = ColorSelect1:GetColor() or Color(255,255,255)
		local cs2 = ColorSelect2:GetColor() or Color(255,255,255)
		local cs3 = ColorSelect3:GetColor() or Color(255,255,255)
		local cs4 = ColorSelect4:GetColor() or Color(255,255,255)
		local cs5 = ColorSelect5:GetColor() or Color(255,255,255)
		local cs6 = ColorSelect6:GetColor() or Color(255,255,255)
		
		self:MsgStart()
			net.WriteEntity( ent )
			net.WriteTable( cs1 )
			net.WriteTable( cs2 )
			net.WriteTable( cs3 )
			net.WriteTable( cs4 )
			net.WriteTable( cs5 )
			net.WriteTable( cs6 )
		self:MsgEnd()

	end
end




-- local function TheTest()

	-- local frame = vgui.Create( "DFrame" )
	-- frame:SetSize( 500, 300 )
	-- frame:SetTitle( tostring( ent ) )
	-- frame:Center()
	-- frame:SetVisible( true )
	-- frame:SetDraggable( true )
	-- frame:SetScreenLock( false )
	-- frame:ShowCloseButton( true )
	-- frame:Center()
	-- frame:MakePopup()
	-- frame:SetKeyboardInputEnabled( false )
	
	
	-- BGPanel = vgui.Create("DPanel", frame)
	-- local min, max = game.GetWorld():GetModelBounds()
	-- BGPanel:SetPos( 10, 10 )
	-- BGPanel:SetSize(max.x, max.y)
	-- print(max.x + max.y, LocalPlayer():GetPos())
	-- BGPanel:SetBackgroundColor(Color(12, 41, 82, 255))
	
	
	-- function BGPanel:Paint(w,h)
	 	-- local mat = Material("data/mapimages/"..game.GetMap().."_"..(math.floor(ScrH() * 0.8))..".jpg")
		-- surface.SetDrawColor(Color(255, 255, 255, 200))
		-- surface.SetMaterial(mat)
		-- surface.DrawTexturedRect( w, w, 800, 800, 0, 0, 1,1 )
		-- self:DrawTexturedRect()
		-- local plypos = LocalPlayer():GetPos()
		-- self:SetPos( plypos.x, plypos.y )
		-- print( plypos.x + max.x*-1, plypos.y + max.y*-1 )
		
	-- end
	-- print("shit")

	
-- end








properties.Add( "respray", {
	MenuLabel = "#Respray",
	Order = 1869,
	MenuIcon = "icon16/color_wheel.png",
	Filter = function( self, ent, ply )

		if ( !IsValid( ent ) ) then return false end
		if ( ent:IsPlayer() ) then return false end
		-- if ( true ) then return false end
		-- if ( !gamemode.Call( "CanProperty", ply, "respray", ent ) ) then return false end

		return true

	end,
	Action = function( self, ent )

		ResprayMenu(self,ent)
		-- TheTest()
	end,

	Receive = function( self, length, ply )

		local ent = net.ReadEntity()

		local ColorTable = {}
		table.insert(ColorTable, 1, net.ReadTable() )
		table.insert(ColorTable, 2, net.ReadTable() )
		table.insert(ColorTable, 3, net.ReadTable() )
		table.insert(ColorTable, 4, net.ReadTable() )
		table.insert(ColorTable, 5, net.ReadTable() )
		table.insert(ColorTable, 6, net.ReadTable() )

		SetProxyColor( nil, ent, ColorTable )

	end

} )