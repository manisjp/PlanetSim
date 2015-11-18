require "gosu"

class Planet

	def initialize data, system_size, window_size
		@system_size = system_size.to_f*2
		@xpos = data[0].to_f/@system_size*window_size + window_size/2
		@ypos = data[1].to_f/@system_size*window_size + window_size/2
		@xvel = data[2].to_f
		@yvel = data[3].to_f
		@mass = data[4].to_f
		@image = Gosu::Image.new("images/#{data[5]}")
	end

	def draw 
		@image.draw(@xpos,@ypos,1)
	end

end