require "byebug"

class Room

  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    @occupants.count < @capacity ? false : true
  end

  def available_space
    @capacity - @occupants.count
  end

  def add_occupant(name)
    return false if full?
    @occupants << name
    true
  end

end


# started Room class / Part 01 ~1:25p
# finished Room class / Part 01 ~1:32p
# 7min(with ternary bug)