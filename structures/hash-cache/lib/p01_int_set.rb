class MaxIntSet
  attr_reader :max
  def initialize(max)

  end

  def insert(num)

  end

  def remove(num)

  end

  def include?(num)

  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end

require 'byebug'
class IntSet
  def initialize(num_buckets = 3)

  end

  def insert(num)

  end

  def remove(num)

  end

  def include?(num)

  end

  private

  def [](num)

  end

  def num_buckets

  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 2)

  end

  def insert(num)

  end

  def remove(num)

  end

  def include?(num)

  end

  private

  def [](num)

    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets

  end

  def resize!
    
  end
end
