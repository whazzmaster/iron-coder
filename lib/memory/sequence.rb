module Memory
  class Sequence
    attr_reader :notes

    def initialize(notes)
      @notes = notes
    end

    def self.possible_notes
      %w(A B C D E)
    end

    def self.generate(quantity)
      new(Array.new(quantity){ Note.new(possible_notes.sample) })
    end

    def self.build(sequence)
      notes = sequence.split('').collect{ |note| Note.new(note) }
      new(notes)
    end

    def peek
      notes.first
    end

    def count
      notes.count
    end

    def next
      notes.shift
    end

    def finished?
      notes.empty?
    end

    def ==(other)
      notes == other.notes
    end
  end
end