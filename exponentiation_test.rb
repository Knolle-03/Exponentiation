# Authors:: Lennart Draeger, Robert Gnehr
# Aufgabe: a06_5
#
#
require 'test/unit'
require_relative 'exponentiation'
class ExponentiationTest < Test::Unit::TestCase

  def setup
    @p2 = Exponentiation.new(-3)
    @p3 = Exponentiation.new(-2)
    @p4 = Exponentiation.new(-1)
    @p5 = Exponentiation.new(0)
    @p6 = Exponentiation.new(1)
    @p7 = Exponentiation.new(2)
    @p8 = Exponentiation.new(3)
    @range = (@p2..@p8)
    @range2 = (@p2...@p8)
  end
  # Checks if calculation and argument checking works as intended.
  def test_values
    assert_equal((3**-3).to_s, @p2.to_s)
    assert_equal((3**-2).to_s, @p3.to_s)
    assert_equal((3**-1).to_s, @p4.to_s)
    assert_equal((3**0).to_s, @p5.to_s)
    assert_equal((3**1).to_s, @p6.to_s)
    assert_equal((3**2).to_s, @p7.to_s)
    assert_equal((3**3).to_s, @p8.to_s)
    assert_raise(ArgumentError) {Exponentiation.new(-1.4)}
    assert_raise(ArgumentError) {Exponentiation.new(test)}
    assert_nothing_raised(ArgumentError) {Exponentiation.new(Exponentiation.new(3).to_i)}
  end
  # Tests if the objects of the Exponentiation class work as ranges.
  def test_ranges
   assert_equal(@range.begin.to_f, @p2.to_f)
   assert(@range.cover?(@p5))
   assert(@range.end == @p8)
   assert(@range2.exclude_end?)
   assert_false(@range.exclude_end?)
   assert(@range.include?(@p3))
   assert(@range.max == @p8)
   assert(@range2.max == @p7)
   assert(@range.last(3) == [@p6, @p7, @p8])
   assert(@range.size == nil)
  end
end