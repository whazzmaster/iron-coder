require './test/test_helper'

class GameTest < Minitest::Test
  def test_it_exists
    assert Memory::Game
  end

  def test_it_can_be_won
    game = Memory::Game.new(5, "ABC")
    game.start
    assert_equal 3, game.moves_left
    game.play(["A"])
    game.play(["A", "B"])
    game.play(["A", "B", "C"])
    assert game.won?, "game is won after all correct moves executed"
  end

  def test_it_can_be_lost
    game = Memory::Game.new(5, "ABCDE")
    game.start
    wrong_first_note = "E"
    refute game.play([wrong_first_note]), "move should be incorrect"
    refute game.won?, "game is not won"
    assert game.lost?, "game is lost after an incorrect move"
  end

  def test_it_plays_back_the_sequence_so_far
    game = Memory::Game.new(5, "ABC")
    game.start
    assert_equal game.next_sequence, Memory::Sequence.build("A")
    game.play(["A"])
    assert_equal game.next_sequence, Memory::Sequence.build("AB")
    game.play(["A", "B"])
    assert_equal game.next_sequence, Memory::Sequence.build("ABC")
    game.play(["A", "B", "C"])
    assert game.won?
  end
end