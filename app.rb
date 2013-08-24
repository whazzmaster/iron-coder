$:.unshift(File.dirname(__FILE__) + "/lib")
require 'midi'
require 'interface'
require 'memory'

Shoes.app(title: 'Keyboard Hero', height: 250) do
	app = self
	game_manager = Memory::GameManager.new app
	
	stack do
		game_manager.layout_game
	end

  game_manager.play

  button("Play!") do 
    every(0.5) do 
      puts "Toggling sequence start"
      game_manager.play_sequence_step
      puts "Toggling sequence stop"
    end
  end
end
