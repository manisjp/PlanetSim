require "gosu"

class Planet

	def initialize xpos, ypos, xvel, yvel, mass, image 
		@xpos = xpos
		@ypos = ypos
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@image = Gosu::Image.new("images/#{image}")
	end

	def draw 
		@image.draw(@xpos,@ypos,1)
	end

end