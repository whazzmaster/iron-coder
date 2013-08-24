require './test/test_helper'

class PlayerTest < Minitest::Test
  def test_it_exists
    assert Memory::Player
  end

  def test_it_plays_notes
    %w(A B C D E F G).each do |note|
      assert Memory::Player.new.play(note)
    end
  end
end