
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable
  def initialize
    # these are your sentinel nodes, without them you'd have to do lot of nil checking
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    start_node = @head.next
    until start_node == @tail
      return start_node.val if start_node.key == key
      start_node = start_node.next
    end
    nil
  end

  def include?(key)
    start_node = @head.next
    until start_node == @tail
      if start_node.key == key
        return true
      end
      start_node = start_node.next
    end
    false
  end

  def insert(key, val)
    link_new = Link.new(key, val)
    link_new.next = @tail
    link_new.prev = @tail.prev
    @tail.prev.next = link_new
    @tail.prev = link_new
  end

  def remove(key)
    start_node = @head.next
    until start_node == @tail
      if start_node.key == key
        start_node.prev.next = start_node.next
        start_node.next.prev = start_node.prev
        break
      end
      start_node = start_node.next
    end
    nil
  end

  def each(&prc)
    start_node = @head.next
    until start_node == @tail
      prc.call(start_node)
      start_node = start_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
