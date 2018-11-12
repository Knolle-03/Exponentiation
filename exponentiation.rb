# Aufgabe a06_4
# Team ChillyCrabs
# Author:: Lennart Draeger
# Author:: Robert Gnehr

# This class lets you Exponentiations with 3 as the base that are usable in ranges.
class Exponentiation
  attr_reader :value, :exponent
  protected :value
  include Comparable

  def initialize(exponent)
    if exponent.is_a?(Integer)
      @value = 3**exponent
      @exponent = exponent
    else
      raise ArgumentError, "Argument has to be an integer."
    end
  end
  # Makes the objects comparable
  def <=>(other)
    raise ArgumentError, "Needs to be of the same class to be comparable." unless other.is_a?(Exponentiation)
    [@value] <=> [other.value]
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    [@value] == [other.value]
  end

  def succ
    Exponentiation.new(@exponent + 1)
  end

  def to_f
    @value.to_f
  end

  def to_i
    @value.to_i
  end

  def to_s
    @value.to_s
  end
end