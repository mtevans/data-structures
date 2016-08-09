class Fixnum

end

class Array
  def hash
    hash_num = 0
    self.each_with_index do |num, idx|
      hash_num += idx.hash ^ num.hash
    end
  hash_num
  end
end

class String
  def hash
    hash_num = 0
    self.split("").each_with_index do |letter, idx|
      hash_num += letter.ord.hash ^  idx.hash
    end
    hash_num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = 0
    self.each do |k, v|
      hash_num += k.hash ^ v.hash
    end
    hash_num
  end
end
