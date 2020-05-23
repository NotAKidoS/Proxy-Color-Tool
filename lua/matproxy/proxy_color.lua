//This is where we add the proxies so the engine can check for them. Not sure if there is a limit or performance impact yet.

//This is also where we set the functions onto supported props/vehicles so they dont need to add context menu support themselves.
//In cases like SGM, TDM, LW, Roys, and many many many other vehicle packs including mine that have multiple uploads for each vehicle,
//adding support like this allows every vehicle to be supported from a creator just by updating their materials (very handy if they are shared between all)
//Otherwise, authors would need to add support for each vehicle manually, which I guess is still kinda possible.



// I got this off the facepunch wiki so honestly I dont know too much on its specifics.


matproxy.Add( {

	name = "ColorSlot1", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO
		-- print("ColorSlot1")  
		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot1 ) then
			local col = (ent:ColorSlot1())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else

			if ( ent.ColorSlot1 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot1 = function() return Vector(1,1,1) end
				-- mat:SetVector( self.ResultTo, Vector(1,1,1) )
			else
				ent.ColorSlot1 = function() return util.StringToType(self.Values.fcolor, "Vector") end
				-- mat:SetVector( "$color2", util.StringToType(self.Values.fcolor, "Vector") )
			end

			ent.ColorSlot1Name = self.Values.name
		end
	end
} )

matproxy.Add( {

	name = "ColorSlot2", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO

		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot2 ) then
			local col = (ent:ColorSlot2())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else
			if ( ent.ColorSlot2 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot2 = function() return Vector(1,1,1) end
			else
				ent.ColorSlot2 = function() return util.StringToType(self.Values.fcolor, "Vector") end
			end
			
			ent.ColorSlot2Name = self.Values.name
		end
	end
} )

matproxy.Add( {

	name = "ColorSlot3", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO

		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot3 ) then
			local col = (ent:ColorSlot3())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else
			if ( ent.ColorSlot3 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot3 = function() return Vector(1,1,1) end
			else
				ent.ColorSlot3 = function() return util.StringToType(self.Values.fcolor, "Vector") end
			end
			
			ent.ColorSlot3Name = self.Values.name
		end
	end
} )

matproxy.Add( {

	name = "ColorSlot4", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO

		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot4 ) then
			local col = (ent:ColorSlot4())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else
			if ( ent.ColorSlot4 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot4 = function() return Vector(1,1,1) end
			else
				ent.ColorSlot4 = function() return util.StringToType(self.Values.fcolor, "Vector") end
			end
			
			ent.ColorSlot4Name = self.Values.name
		end
	end
} )

matproxy.Add( {

	name = "ColorSlot5", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO

		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot5 ) then
			local col = (ent:ColorSlot5())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else
			if ( ent.ColorSlot5 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot5 = function() return Vector(1,1,1) end
			else
				ent.ColorSlot5 = function() return util.StringToType(self.Values.fcolor, "Vector") end
			end
			
			ent.ColorSlot5Name = self.Values.name
		end
	end
} )

matproxy.Add( {
	
	name = "ColorSlot6", --// Set the proxy to have the material check for when it is loaded into the game on a model

	//------------------------------------------

	init = function( self, mat, values ) --// THIS IS RAN EVERY TIME THE GAME LOADS A MATERIAL WITH THE PROXY
		self.ResultTo = values.resultvar
	end,
	
	//------------------------------------------

	bind = function( self, mat, ent ) --// Ran every tick I think NOPE EVERY FRAME OH NO

		if ( !IsValid( ent ) ) then return end
		
		if ( ent.ColorSlot6 ) then
			local col = (ent:ColorSlot6())

			if ( isvector( col ) ) then
				mat:SetVector( self.ResultTo, col )
			end
		else
			if ( ent.ColorSlot6 ) then return end

			if self.Values.fcolor == nil then
				ent.ColorSlot6 = function() return Vector(1,1,1) end
			else
				ent.ColorSlot6 = function() return util.StringToType(self.Values.fcolor, "Vector") end
			end
			
			ent.ColorSlot6Name = self.Values.name
		end
	end
} )
  