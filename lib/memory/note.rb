module Memory
  class Note
    attr_reader :name

    def initialize(name = "A")
      @name = name
    end

    def play
      true
    end

    def matches?(note)
      name == note
    end

    def ==(other)
      name == other.name
    end
  end
end