module Memory
  class Game
    def initialize(game_length)

    end

    def start
      self
    end

    def sequence
      Array.new(10)
    end

    def play(move)
      true
    end

    def won?
      true
    end
  end
end