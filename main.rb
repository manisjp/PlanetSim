require "gosu"
require_relative "planet"

class SimWindow < Gosu::Window

	G = 6.67408e-11	

	def initialize sim
		@window_size = 640
		super @window_size, @window_size
		self.caption = "Planet Simulation"
	
		@data = File.read("#{sim}")
		@lines = @data.split("\n")
		@planets_data = @lines[2..6].map {|planet| planet.split(" ") }
		
		@background_image = Gosu::Image.new("images/space.jpg")
		
		@planets = []
		@planets_data.each { |planet| @planets.push(Planet.new(planet, @lines[1].to_f*2, @window_size)) }
	end

	def update

	end

	def draw
		@background_image.draw(0,0,0)
		@planets.each { |planet| planet.draw }
	end

	def button_down id
		close if id == Gosu::KbEscape
	end

end

window = SimWindow.new("simulations/planets.txt")
window.show
