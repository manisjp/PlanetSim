require "gosu"
require_relative "planet"

class SimWindow < Gosu::Window

	G = 6.67408e-11

	def initialize
		super 640, 640
		self.caption = "Planet Simulation"
		
		@background_image = Gosu::Image.new("images/space.jpg")
		# @planets = []
	end

	def update
		# @planets.push(Planet.new)
	end

	def draw
		@background_image.draw(0,0,0)
		# @planets.each { |planet| planet.draw }
	end

	def button_down id
		close if id == Gosu::KbEscape
	end

end

# $data = File.read("planets.txt")
# $
window = SimWindow.new
window.show