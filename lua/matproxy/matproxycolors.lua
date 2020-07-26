matproxy.Add( {
	name = "ColorSlot1",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot1) then --only run once
			ent.ColorSlot1Name = self.Name
			ent.ColorSlot1 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot1)
	end
} )

matproxy.Add( {
	name = "ColorSlot2",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot2) then --only run once
			ent.ColorSlot2Name = self.Name
			ent.ColorSlot2 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot2)
	end
} )

matproxy.Add( {
	name = "ColorSlot3",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot3) then --only run once
			ent.ColorSlot3Name = self.Name
			ent.ColorSlot3 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot3)
	end
} )

matproxy.Add( {
	name = "ColorSlot4",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot4) then --only run once
			ent.ColorSlot4Name = self.Name
			ent.ColorSlot4 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot4)
	end
} )

matproxy.Add( {
	name = "ColorSlot5",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot5) then --only run once
			ent.ColorSlot5Name = self.Name
			ent.ColorSlot5 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot5)
	end
} )

matproxy.Add( {
	name = "ColorSlot6",
	--ran when a material with the proxy is spawned
	init = function( self, mat, values )
		self.Name = values.name
		self.Color = values.resultvar
		self.FColor = values.fcolor and util.StringToType(values.fcolor, "Vector")
	end,
	--ran every frame (not sure if it is the fastest way :<)
	bind = function( self, mat, ent )
		if (!IsValid( ent )) then return end
		if (!ent.ColorSlot6) then --only run once
			ent.ColorSlot6Name = self.Name
			ent.ColorSlot6 = self.FColor or Vector(1,1,1)
		end
		mat:SetVector(self.Color,ent.ColorSlot6)
	end
} )