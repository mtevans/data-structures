require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    var = self[@length - 1]
    self[@length - 1] = nil
    @length -= 1

    var

  end

  # O(1) ammortized
  def push(val)
    resize! if (length == @capacity)

    @length += 1
    self[@length - 1] = val

    nil
  end

  # O(1)
  def shift
    var = self[0]
    self[0] =  nil
    @length -= 1
    @start_idx = (start_idx + 1) % @capacity


    var

  end

  # O(1) ammortized
  def unshift(val)
    resize! if (length == @capacity)

    @start_idx = (start_idx - 1) % @capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    if @length == 0 || index > (@length - 1)
      raise "index out of bounds"
    end
  end



  def resize!
    newcapacity = @capacity * 2
    temp_store = StaticArray.new(newcapacity)

    0.upto(@length - 1).each do |i|
      temp_store[i] = self[i]
    end

    @capacity = newcapacity
    @store = temp_store
    @start_idx = 0

  end
end
