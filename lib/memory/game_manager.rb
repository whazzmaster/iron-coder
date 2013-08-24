module Memory
	class GameManager
		def initialize(app)
			@app = app

			@key_mappings = {
				'a' => Interface::Button.new(@app, 70, 70, 50, 50, @app.rgb(138, 43, 226)),
				's' => Interface::Button.new(@app, 140, 70, 50, 50, @app.rgb(127, 255, 0)),
				'd' => Interface::Button.new(@app, 210, 70, 50, 50, @app.rgb(255, 140, 0)),
				'f' => Interface::Button.new(@app, 280, 70, 50, 50, @app.rgb(65, 105, 225)),
			}

			@labels = {
				'a' => { left: 85, top: 125},
				's' => { left: 155, top: 125},
				'd' => { left: 225, top: 125},
				'f' => { left: 300, top: 125}
			}

			@game = Memory::Game.new(8, 'ABCD').start
			@button_manager = Interface::ButtonManager.new(@app, @key_mappings).listen
		end

		def play
			# while !@game.won?
				
			# end
		end

		def on_win(&block)
			@on_win = block
		end

		def layout_game
			@app.stack do
				@key_mappings.each {|key,button| button.element }

				@labels.each do |char, coordinates|
					label = @app.title char
					label.move coordinates[:left], coordinates[:top]
				end
			end
		end
	end
end