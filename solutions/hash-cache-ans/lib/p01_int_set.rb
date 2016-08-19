class MaxIntSet
  attr_reader :max
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    return true if @store[num] == true
    false
  end

  private

  def is_valid?(num)
    num.between?(0,max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

require 'byebug'
class IntSet
  def initialize(num_buckets = 3)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
    #@store.include? @store == array class? or IntSet class?
    #is @store.include?(num) calling itself? or Array class?
  end

  def remove(num)
    return false unless self.include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % 3]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 2)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self.resize! if @count == num_buckets && !self.include?(num)
    self[num] << num unless self.include?(num)
    @count += 1
  end

  def remove(num)
    # return false unless self.include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    hold = []
    store_dup = @store.dup
    store_dup.flatten.each do |num|
      hold << num
      self.remove(num)
    end

    @store += Array.new(num_buckets) { Array.new }

    hold.each do |num|
      insert(num)
    end

  end
end
