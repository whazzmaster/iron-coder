require './test/test_helper'

class NoteTest < Minitest::Test
  def test_it_exists
    assert Memory::Note
  end

  def test_it_is_playable
    assert Memory::Note.new.play
  end

  def test_it_matches_the_correct_input
    assert Memory::Note.new("A").matches?("A")
  end

  def test_it_does_not_match_an_incorrect_input
    refute Memory::Note.new("A").matches?("B")
  end
end