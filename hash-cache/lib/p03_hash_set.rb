require_relative 'p02_hashing'

class HashSet
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
    # return false unless self.include?(num.hash)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end



  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num.hash`
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
