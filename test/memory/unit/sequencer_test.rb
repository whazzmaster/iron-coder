require './test/test_helper'

class SequencerTest < Minitest::Test
  def test_it_exists
    assert Memory::Sequencer
  end

  def test_it_generates_sequence_of_a_certain_size
    assert_equal 10, Memory::Sequencer.new.generate(10).count
  end

  def test_it_generates_playable_notes
    assert Memory::Sequencer.new.generate(1).first.play
  end
end