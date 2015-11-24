require "gosu"

class Planet

	attr_reader :xpos, :ypos, :xvel, :yvel, :mass

	G = 6.67408e-11
	
	def initialize data, system_size, window_size
		@system_size, @window_size = system_size, window_size
		@xpos, @ypos = data[0].to_f, data[1].to_f
		@xvel, @yvel = data[2].to_f, -data[3].to_f
		@oxvel, @oyvel = data[2].to_f, -data[3].to_f
		@forcex = 0
		@forcey = 0
		@mass = data[4].to_f
		@image = Gosu::Image.new("images/#{data[5]}")
	end

	def draw
		@image.draw(@xpos/@system_size*@window_size + @window_size/2,@ypos/@system_size*@window_size + @window_size/2,1)
	end

	def move planets
		@xpos += @xvel*10000
		@ypos += @yvel*10000
	
		planets.each do |planet|
			@dx = planet.xpos - @xpos
			@dy = planet.ypos - @ypos
			@r = Math.sqrt(@dx**2 + @dy**2)
			if @r == 0
				@forcex += 0
				@forcey += 0
		 	else
				@forcex += G*@mass*planet.mass*@dx/@r**3
				@forcey += G*@mass*planet.mass*@dy/@r**3
			end
		end
	
		@xvel += @forcex*10000/@mass
		@yvel += @forcey*10000/@mass
	end

end
