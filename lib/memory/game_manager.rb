module Memory
	class GameManager
		attr_reader :game

		def initialize(app)
			@app = app

			@key_mappings = {
				'a' => Interface::MusicalInputButton.new(@app, 70, 70, 50, 50, @app.rgb(138, 43, 226)),
				's' => Interface::MusicalInputButton.new(@app, 140, 70, 50, 50, @app.rgb(127, 255, 0)),
				'd' => Interface::MusicalInputButton.new(@app, 210, 70, 50, 50, @app.rgb(255, 140, 0)),
				'f' => Interface::MusicalInputButton.new(@app, 280, 70, 50, 50, @app.rgb(65, 105, 225)),
			}

			@labels = {
				'a' => { left: 85, top: 125},
				's' => { left: 155, top: 125},
				'd' => { left: 225, top: 125},
				'f' => { left: 300, top: 125}
			}

			#@game = Memory::Game.new(8, 'ABCD').start
			@button_manager = Interface::ButtonManager.new(@app, @key_mappings)
			@button_manager.listen
		end

		def on_win(&block)
			@on_win = block
		end

		def layout_game
			@game = Game.new(6)

			@app.stack do
				@key_mappings.each {|key,button| button.element }

				@labels.each do |char, coordinates|
					label = @app.title char
					label.move coordinates[:left], coordinates[:top]
				end
			end
		end

		def play
			game.start
			#play_example(game.next_sequence)
			@play_index = 0
			@element_on = false
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