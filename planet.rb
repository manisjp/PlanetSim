require "gosu"

class Planet

	attr_reader :xpos, :ypos, :xvel, :yvel, :mass

	G = 6.67408e-11
	
	def initialize data, system_size, window_size
		@system_size, @window_size = system_size, window_size
		@xpos, @ypos = data[0].to_f, data[1].to_f
		@xvel, @yvel = data[2].to_f, data[3].to_f
		@force = 0.0
		@mass = data[4].to_f
		@image = Gosu::Image.new("images/#{data[5]}")
	end

	def draw
		@image.draw(@xpos/@system_size*@window_size + @window_size/2,@ypos,1)
	end

	def move planets
		planets.each do |planet|
			@dx = planet.xpos - @xpos
			@dy = @ypos - planet.ypos
			@r = Math.sqrt(@dx**2 + @dy**2)

			if @r == 0
				@force = 0
			else
				@force = G*@mass*planet.mass/(@r**2)
				@xvel += @force*10000*@dx/@mass/@r
				@yvel += @force*10000*@dy/@mass/@r
			end
		end
		puts @ypos
		@xpos += @xvel
		@ypos += @yvel
	end

end
