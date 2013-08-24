module Interface
	class ButtonManager
		def initialize(app, mappings)
			@app = app
			@mappings = mappings
		end

		def listen
			@app.keypress do |key|
				@mappings[key].key_down if @mappings[key]
			end

			@app.keyrelease do |key|
				@mappings[key].key_up if @mappings[key]
			end
		end
	end
end