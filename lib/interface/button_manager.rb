module Interface
	class ButtonManager
		attr_accessor :game, :game_manager

		def initialize(app, mappings)
			@app = app
			@mappings = mappings
			@notes = Memory::Note.build_set(mappings.keys)
		end

		def listen
			@app.keypress do |key|
				@mappings[key].key_down if @mappings[key]
				play_note(key)
				track_key(key)
			end

			@app.keyrelease do |key|
				@mappings[key].key_up if @mappings[key]
			end
		end

		def play_note(key)
			@notes[key].play if @notes[key]
		end

		def track_key(key)
			@pending_keys ||= []
			@pending_keys << key.upcase

			@expected_keys = game.next_sequence.count
			if @pending_keys.count == @expected_keys
				puts "Expected #{game.next_sequence.inspect}"
				puts "Actual: #{@pending_keys}"
				game.play(@pending_keys)
				if game.won?
					@app.alert "You Win!"
				elsif game.lost?
					@app.alert "You Lose!"
				else
					@pending_keys = []
					game_manager.play_sequence
				end
			end
		end
	end
end