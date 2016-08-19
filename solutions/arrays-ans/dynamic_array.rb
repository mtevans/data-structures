require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize()
    @count = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    if @length == 0 || index > (@length - 1)
      raise "index out of bounds"
    end
    @store[index]
  end

  # O(1)
  def []=(index, value)
    if @length == 0
      raise "index out of bounds"
    end
    @store[index] = value
  end

  # O(1)
  def pop
  if @length == 0
    raise "index out of bounds"
  end
    @count -= 1
    @length -= 1
    # count is not the index of the item we just popped
    @store[@count]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @count == @capacity
    @length += 1
    @store[@count] = val
    @count += 1

  end

  # O(n): has to shift over all the elements.
  def shift
    if @length == 0
      raise "index out of bounds"
    end

    val = self[0]

    1.upto(@length - 1).each do |i|
      self[i - 1] = self[i]
    end
    @count -= 1
    @length -= 1

    return val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @count == @capacity
    self.length += 1

    (@length - 2).downto(0).each  do |i|
      self[i + 1] = self[i]
    end

    self[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = @capacity * 2
    temp_store = StaticArray.new(@capacity)

    0.upto(@length).each do |i|
      temp_store[i] = @store[i]
    end

    @store = temp_store
  end
end
