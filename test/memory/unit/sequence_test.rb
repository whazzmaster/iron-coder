require './test/test_helper'

class SequenceTest < Minitest::Test
  def test_it_exists
    assert Memory::Sequence
  end

  def test_it_generates_sequence_of_a_certain_size
    assert_equal 10, Memory::Sequence.generate(10).count
  end

  def test_it_generates_playable_notes
    assert Memory::Sequence.generate(1).peek.play
  end

  def test_it_generates_with_randomness
    refute_equal Memory::Sequence.generate(20), Memory::Sequence.generate(20)
  end

  def test_equality_of_sequences
    assert_equal Memory::Sequence.build("ABC"), Memory::Sequence.build("ABC")
  end

  def test_it_creates_subsequences
    sequence = Memory::Sequence.build("ABCEF")
    subsequence = sequence.for_range(0, 2)
    expected = Memory::Sequence.build("ABC")
    assert_equal expected, subsequence
  end
end