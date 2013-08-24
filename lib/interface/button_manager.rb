module Interface
	class ButtonManager
		def initialize(app, mappings)
			@app = app
			@mappings = mappings
			@notes = Memory::Note.build_set(mappings.keys)
		end

		def listen
			@app.keypress do |key|
				@mappings[key].key_down if @mappings[key]
				play_note(key)
			end

			@app.keyrelease do |key|
				@mappings[key].key_up if @mappings[key]
			end
		end

		def play_note(key)
			@notes[key].play if @notes[key]
		end
	end
end