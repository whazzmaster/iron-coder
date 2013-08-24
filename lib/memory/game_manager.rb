module Memory
	class GameManager
		def initialize(app)
			@app = app

			@key_mappings = {
				'a' => Interface::Button.new(@app, 170, 100, 50, 50, @app.rgb(138, 43, 226)),
				's' => Interface::Button.new(@app, 240, 100, 50, 50, @app.rgb(127, 255, 0)),
				'd' => Interface::Button.new(@app, 310, 100, 50, 50, @app.rgb(255, 140, 0)),
				'f' => Interface::Button.new(@app, 380, 100, 50, 50, @app.rgb(65, 105, 225)),
			}

			@labels = {
				'a' => { left: 185, top: 155},
				's' => { left: 255, top: 155},
				'd' => { left: 325, top: 155},
				'f' => { left: 400, top: 155}
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
				banner = @app.banner("Keyboard Hero")
				banner.margin_left = 10
				banner.margin_top = 10

				@key_mappings.each {|key,button| button.element }

				@labels.each do |char, coordinates|
					label = @app.title char
					label.move coordinates[:left], coordinates[:top]
				end
			end
		end
	end
end