module Memory
  class Sequencer
    def generate(quantity)
      Array.new(quantity){ Note.new }
    end

  end
end