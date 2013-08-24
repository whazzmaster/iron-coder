module Memory
  class Note
    attr_reader :name

    def initialize(name = "A")
      @name = name
    end

    def self.player
      @player ||= Player.new
    end

    def play(duration = 0.3)
      Note.player.play(name, duration)
    end

    def matches?(note)
      name == note
    end

    def ==(other)
      name == other.name
    end
  end
end