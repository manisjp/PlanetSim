require "gosu"

class Planet

	G = 6.67408e-11
	
	def initialize data, system_size, window_size
		@xpos = data[0].to_f/system_size*window_size + window_size/2
		@ypos = data[1].to_f/system_size*window_size + window_size/2
		@xvel = data[2].to_f
		@yvel = data[3].to_f
		@mass = data[4].to_f
		@image = Gosu::Image.new("images/#{data[5]}")
		@totalf = 0
	end

	def draw 
		@image.draw(@xpos,@ypos,1)
	end

	def totalf planet2
		@r = Math.sqrt((planet2[0] - @xpos)**2 + (planet2[1] - @ypos)**2 )
		@totalf += G*@mass*planet2[4]/r**2
	end

end
