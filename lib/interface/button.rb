module Interface
	class MusicalInputButton < Shoes
		def initialize(app, top, left, width, height, color)
			@top = top
			@left = left
			@width = width
			@height = height
			@color = color
			@app = app

			# @element = app.stack do
			# 	app.fill color
			# 	app.rect top, left, width, height
			# end

			@app.fill white
			@element = @app.rect top, left, width, height

			@element.click do
				@app.alert 'yo!'
			end
		end

		def key_down
			@element.style(fill: @color)
		end

		def key_up
			@element.style(fill: white)		
		end

		def activate
			# key_down
			# play note
			# key_up
		end

		attr_accessor :element
	end
end