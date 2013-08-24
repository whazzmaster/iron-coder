module Memory
  class Game
    attr_reader :sequence, :lost

    def initialize(game_length, sequence = nil)
      @lost = false
      @sequence = Sequence.build(sequence) || Sequence.generate(game_length)
    end

    def start
      self
    end

    def play(move)
      sequence.next.matches?(move) || (lose! && false)
    end

    def moves_left
      sequence.count
    end

    def won?
      sequence.finished?
    end

    def lost?
      lost
    end

    def lose!
      @lost = true
    end
  end
end