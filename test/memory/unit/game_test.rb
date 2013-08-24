require './test/test_helper'

class GameTest < Minitest::Test
  def test_it_exists
    assert Memory::Game
  end

  def test_it_can_be_won
    game = Memory::Game.new(10).start
    expected_sequence = game.sequence
    assert_equal 10, expected_sequence.size
    expected_sequence.each do |next_note|
      assert game.play(next_note)
    end
    assert game.won?
  end
end