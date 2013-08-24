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

  game_manager.play

  button("Play Sequence") do 
    every(1) do 
      puts "Toggling sequence start"
      game_manager.play_sequence_step
      puts "Toggling sequence stop"
    end
  end
end