Shoes.app do
	stack do
		@title = para "Woo!"
		@button = button "paste from clipboard"
		@button.click do
			@title = para clipboard()
		end
	end
 end