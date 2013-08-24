module Memory
  class Sequencer
    def generate(quantity)
      Array.new(quantity){ Note.new }
    end

    def build(sequence)
      sequence.split('').collect{ |note| Note.new(note) }
    end
  end
end