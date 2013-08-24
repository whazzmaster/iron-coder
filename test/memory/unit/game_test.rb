require './test/test_helper'

class GameTest < Minitest::Test
  def test_it_exists
    assert Memory::Game
  end

  def test_it_can_be_won
    game = Memory::Game.new(5, "ABCDE").start
    assert_equal 5, game.moves_left
    "ABCDE".split('').each do |next_note|
      assert game.play(next_note), "note #{next_note.inspect} matches the next note"
    end
    assert game.won?, "game is won after all correct moves executed"
  end

  def test_it_can_be_lost
    game = Memory::Game.new(5, "ABCDE").start
    wrong_first_note = "E"
    refute game.play(wrong_first_note), "move should be incorrect"
    refute game.won?, "game is not won"
    assert game.lost?, "game is lost after an incorrect move"
  end
end