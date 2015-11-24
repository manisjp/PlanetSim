require "gosu"

class Planet

	G = 6.67408e-11

	attr_accessor :xpos, :ypos, :xvel, :yvel, :mass
	
	def initialize data, system_size, window_size
		@xpos = data[0].to_f/system_size*window_size + window_size/2
		@ypos = data[1].to_f/system_size*window_size + window_size/2
		@xvel = data[2].to_f
		@yvel = data[3].to_f
		@mass = data[4].to_f
		@image = Gosu::Image.new("images/#{data[5]}")
		@xforces = 0
	end

	def draw 
		@image.draw(@xpos,@ypos,1)
	end

	def move planets
		planets.each do |planet|
			@dx = planet.xpos - @xpos
			@dy = planet.ypos - @ypos
			@r = Math.sqrt(dx**2 + dy**2)
			if @r == 0
				return
			else
				@totalf += G*@mass*planet.mass/@r**2
			end
			@xtotalf = @totalf*dx/@r
			@ytotalf = @totalf*dy/@r
			@xaccel = @xtotalf/@mass
			@yaccel = @ytotalf/@mass
		end
	end



end
