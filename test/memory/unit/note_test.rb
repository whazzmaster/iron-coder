require './test/test_helper'

class NoteTest < Minitest::Test
  def test_it_exists
    assert Memory::Note
  end

  def test_it_is_playable
    assert Memory::Note.new.play
  end
end