require 'midi'

Shoes.app do
	stack do
		@title = para "Woo!"
		@button = button("play!") {
				@o = UniMIDI::Output.use(:first)

				MIDI.using(@o) do

				  note "C"
				  off 

				  cc 5, 120

				  play "C3", 0.5

				end 
		}

		fill black
		oval 10, 40, 50, 50
	end
 end