module Memory
  class Player
    attr_reader :output

    def initialize
      @output = UniMIDI::Output.all.detect{|o| o.name.include?("Java")}
      @output.open
    end

    def play(name, duration = 0.1)
      note = NoteConverter.convert(name)
      output.puts(0x90, note, 100)
      sleep(duration)
      output.puts(0x80, note, 100)
      true
    end
  end

  class NoteConverter
    def self.convert(name)
      notes.fetch(name)
    end

    def self.notes
      @notes ||= build_notes
    end

    def self.build_notes
      collection = {}
      ('A'..'Z').each_with_index do |element, index|
        collection[element] = 20 + 2*index
      end
      collection
    end
  end
end