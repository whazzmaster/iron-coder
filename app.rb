$:.unshift(File.dirname(__FILE__) + "/lib")
require 'midi'
require 'interface'

Shoes.app do
	@app = self

	key_mappings = {
		'a' => Interface::MusicalInputButton.new(@app, 70, 70, 50, 50, rgb(138, 43, 226)),
		's' => Interface::MusicalInputButton.new(@app, 140, 70, 50, 50, rgb(127, 255, 0)),
		'd' => Interface::MusicalInputButton.new(@app, 210, 70, 50, 50, rgb(255, 140, 0)),
		'f' => Interface::MusicalInputButton.new(@app, 280, 70, 50, 50, rgb(65, 105, 225)),
	}

	Interface::ButtonManager.new(@app, key_mappings).listen

	stack do
		key_mappings.each {|key,button| button.element }
	end
 end