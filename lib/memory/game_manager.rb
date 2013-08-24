module Memory
	class GameManager
		attr_reader :game

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

			@button_manager = Interface::ButtonManager.new(@app, @key_mappings)
			@button_manager.listen
			@game = Game.new(5)
			@button_manager.game = @game
			@button_manager.game_manager = self
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

		def play
			game.start
			@play_index = 0
			@element_on = false
		end

		def play_sequence
			@play_sequence = true
		end

		def play_sequence_step
			if @play_sequence.nil?
				@play_sequence = true
			end

			if @play_sequence
				note = game.next_sequence.notes[@play_index]
				if note
					target = @key_mappings[note.name.downcase]
					if @element_on == false
						target.key_down
						@button_manager.play_note(note.name.downcase)
						@element_on = true
					else
						target.key_up
						@element_on = false
						@play_index += 1
					end
				else
					@play_index = 0
					@element_on = false
					@play_sequence = false
				end
			end
		end

		def play_example(sequence)
			sequence.notes.each do |note|
				@key_mappings[note.name.downcase].key_down
			end
		end
	end
end