module Memory
  class Game
    attr_reader :sequence, :lost, :current_index

    def initialize(game_length, sequence = nil)
      @lost = false
      @sequence = Sequence.build(sequence) || Sequence.generate(game_length)
    end

    def start
      @current_index = 0
    end

    def play(moves)
      unless lost?
        if sequence.for_range(0, current_index) == Sequence.build(moves.join)
          advance
          true
        else
          lose! && false
        end
      else
        raise "You've already lost!"
      end
    end

    def advance
      @current_index += 1
    end

    def moves_left
      sequence.count
    end

    def won?
      current_index == sequence.count
    end

    def lost?
      lost
    end

    def lose!
      @lost = true
    end

    def next_sequence
      sequence.for_range(0, current_index)
    end
  end
end