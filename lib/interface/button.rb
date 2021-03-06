module Interface
	class Button < Shoes
		def initialize(app, top, left, width, height, color)
			@top = top
			@left = left
			@width = width
			@height = height
			@color = color
			@app = app

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

		attr_accessor :element
	end
end