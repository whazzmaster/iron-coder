$:.unshift(File.dirname(__FILE__) + "/lib")
require 'midi'
require 'interface'
require 'memory'

Shoes.app do
	app = self
	game_manager = Memory::GameManager.new app
		
	stack do
		game_manager.layout_game
	end
 end