
local PANEL = {}

PANEL.Models = {}
PANEL.Positions = {}
PANEL.Angles = {}
PANEL.Colors = {}
PANEL.CamPos = Vector(230,125,60)
PANEL.LookAtPos = Vector(0,0,0)
PANEL.CamDist = 200
PANEL.CamAng = Angle(-10,30,0)
PANEL.MouseUse = false
PANEL.MouseHover = false
PANEL.LastMouseX = 0
PANEL.LastMouseY = 0

AccessorFunc( PANEL, "m_fAnimSpeed",     "AnimSpeed" )
AccessorFunc( PANEL, "Entity",             "Entity" )
AccessorFunc( PANEL, "vCamPos",         "CamPos" )
AccessorFunc( PANEL, "fFOV",             "FOV" )
AccessorFunc( PANEL, "vLookatPos",         "LookAt" )
AccessorFunc( PANEL, "colAmbientLight", "AmbientLight" )
AccessorFunc( PANEL, "colColor",         "Color" )
AccessorFunc( PANEL, "bAnimated",         "Animated" )


function PANEL:Init()

    --self = nil
	self.Models = {}
	self.Positions = {}
	self.Angles = {}
    self.LastPaint = 0
    self.DirectionalLight = {}
    
    self:SetCamPos( Vector( 50, 50, 50 ) )
    self:SetLookAt( Vector( 0, 0, 40 ) )
    self:SetFOV( 70 )
    
    self:SetText( "" )
    self:SetAnimSpeed( 0.5 )
    self:SetAnimated( false )
    
    self:SetAmbientLight( Color( 50, 50, 50, 255 ) )
    
    self:SetDirectionalLight( BOX_TOP, Color( 255, 255, 255, 255 ) )
    self:SetDirectionalLight( BOX_FRONT, Color( 255, 255, 255, 255 ) )
    
    self:SetColor( Color( 255, 255, 255, 255 ) )

end

function PANEL:Clear()
	self.Models = {}
	self.Positions = {}
	self.Angles = {}
end

function PANEL:OnMouseWheeled( arg )

	self.CamDist = self.CamDist + arg * -10
end

function PANEL:Think()
	
	if self.MouseUse == true then
		local diffX = self.LastMouseX - gui.MouseX()
		local diffY = self.LastMouseY - gui.MouseY()	
		self.LastMouseX = gui.MouseX()
		self.LastMouseY = gui.MouseY()
		
		self.CamAng.y = self.CamAng.y + diffX * 0.5
		self.CamAng.p = self.CamAng.p + diffY * 0.5
	end


	if self.MouseHover then
		if input.IsKeyDown(KEY_A) then
			self.CamAng.y = self.CamAng.y - 1
		elseif input.IsKeyDown(KEY_D) then
			self.CamAng.y = self.CamAng.y + 1
		end
		
		if input.IsKeyDown(KEY_LSHIFT) then
			if input.IsKeyDown(KEY_S) then
				self.CamDist = self.CamDist + 1
			elseif input.IsKeyDown(KEY_W ) then
				self.CamDist = self.CamDist - 1
			end			
		else
			if input.IsKeyDown(KEY_S) then
				self.CamAng.p = self.CamAng.p - 1
			elseif input.IsKeyDown(KEY_W ) then
				self.CamAng.p = self.CamAng.p + 1
			end	
		end
	end
	
	self.CamDist = math.Clamp(self.CamDist, 10,500)
	self.CamPos = self.CamAng:Forward() * self.CamDist
end


function PANEL:SetDirectionalLight( iDirection, color )
    self.DirectionalLight[iDirection] = color
end


function PANEL:AddModel( strModelName, id )
    
	if ( IsValid( self.Models[id] ) ) then
        self.Models[id]:Remove()
		self.Models[id] = nil        
    end	
	
	 if ( !ClientsideModel ) then return end
	self.Models[id] = ClientsideModel( strModelName, RENDER_GROUP_OPAQUE_ENTITY )
	self.Positions[id] = Vector(0,0,0)
	self.Angles[id] = Angle(0,0,0)
	self.Models[id]:SetNoDraw( true )
	self.Colors[id] = Color(0,0,255,255)
	
end

function PANEL:SetModelPos( id, pos )
	if ( IsValid( self.Models[id] ) ) then
		self.Positions[id] = pos
		self.Models[id]:SetPos(pos)
	end
end

function PANEL:SetModel( id, model )
	if ( IsValid( self.Models[id] ) ) then
        self.Models[id]:Remove()       
		self.Models[id] = ClientsideModel( model, RENDER_GROUP_OPAQUE_ENTITY )
		
		if self.Positions[id] then
			self.Models[id]:SetPos(self.Positions[id])	
		end
		
		if self.Angles[id] then
			self.Models[id]:SetAngles(self.Angles[id])	
		end		
	end
end

function PANEL:GetModelPos( id )
	return self.Positions[id]
end

function PANEL:SetModelAng( id, ang )
	if ( IsValid( self.Models[id] ) ) then
		self.Angles[id] = ang
		self.Models[id]:SetAngles(ang)
	end
end

function PANEL:SetModelColour( id, r,g,b,a )
	if ( IsValid( self.Models[id] ) ) then
		self.Colors[id] = Color(r,g,b,a)
	end
end

function PANEL:RemoveModel( id )
	self.Models[id] = nil        
end

function PANEL:OnMousePressed()
	self.MouseUse = true
	self.LastMouseX = gui.MouseX()
	self.LastMouseY = gui.MouseY()	
end

function PANEL:OnMouseReleased()
	self.MouseUse = false
	self.LastMouseX = gui.MouseX()
	self.LastMouseY = gui.MouseY()		
end

function PANEL:OnCursorEntered()
	self.MouseHover = true
end

function PANEL:OnCursorExited()
	self.MouseUse = false
	self.MouseHover = false
	self.LastMouseX = gui.MouseX()
	self.LastMouseY = gui.MouseY()	
end


function PANEL:Paint()

	-- if SCarEditor.InvalidModelInfo == true then
		-- SCarEditor.InvalidModelInfo = false
		-- SCarEditor:ApplyAllModelSettings()
	-- end

	local x, y = self:LocalToScreen( 0, 0 )
	local w,h = self:GetSize()
	draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Vector(0,0,0) )
	
	local addX = (self:GetWide() - (self:GetWide() * 0.99)) * 0.5
	local addY = (self:GetTall() - (self:GetTall() * 0.99)) * 0.5
	draw.RoundedBox( 4, addX, addY, self:GetWide() * 0.99 , self:GetTall() * 0.99, Vector(150,150,150) )
	

	cam.Start3D( self.CamPos, (self.LookAtPos-self.CamPos):Angle(), self.fFOV, x, y, w,h )
	cam.IgnoreZ( true )
	render.SuppressEngineLighting( true )	
	render.ResetModelLighting( self.colAmbientLight.r/255, self.colAmbientLight.g/255, self.colAmbientLight.b/255 )
	render.SetColorModulation( self.colColor.r/255, self.colColor.g/255, self.colColor.b/255 )
	render.SetBlend( self.colColor.a/255 )
	
	for i=0, 6 do
		local col = self.DirectionalLight[ i ]
		if ( col ) then
			render.SetModelLighting( i, col.r/255, col.g/255, col.b/255 )
		end
	end

	for k,v in pairs(self.Models) do
		if ( !IsValid( v ) ) then return end
		-- render.SetColorModulation( self.Colors[k].r/255, self.Colors[k].g/255, self.Colors[k].b/255 )

		render.SetLightingOrigin( v:GetPos() )

		v:DrawModel()
		
		self:LayoutEntity( v )
		
	end
	
	render.SuppressEngineLighting( false )
	cam.IgnoreZ( false )
	cam.End3D()			

	self.LastPaint = RealTime()	

end


function PANEL:RunAnimation()
    self:FrameAdvance( (RealTime()-self.LastPaint) * self.m_fAnimSpeed )    
end


function PANEL:LayoutEntity( Entity )

end

function PANEL:GenerateExample( ClassName, PropertySheet, Width, Height )

    local ctrl = vgui.Create( ClassName )
        ctrl:SetSize( 300, 300 )
        ctrl:SetModel( "models/error.mdl" )
        
    PropertySheet:AddSheet( ClassName, ctrl, nil, true, true )

end

derma.DefineControl( "DMultiModelPanelPCT", "A panel containing multiple models", PANEL, "DButton" )

--renamed it to not conflict with scars just in case

--------------------------------------------------------------------------------------
//THANK YOU SAKARIAS88
//u r egg hehe <3
--------------------------------------------------------------------------------------