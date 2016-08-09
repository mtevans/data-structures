class BinaryMinHeap
  def initialize(&prc)
    self.store = []
    self.prc = prc || Proc.new{|el1, el2| el1 <=> el2}
  end

  def count
    store.length
  end

  def extract
    value = store[0]

   if count > 1
     store[0] = store.pop
     self.class.heapify_down(store, 0, &prc)
   else
     store.pop
   end

   value
  end

  def peek
  end

  def push(val)
    store << val
    self.class.heapify_up(store, self.count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select do |i|
      i < len
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    l_child_idx, r_child_idx = child_indices(len, parent_idx)

    parent_value = array[parent_idx]

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    if children.all? { |child| prc.call(parent_value, child) <= 0 }
      return array
    end


  swap_idx = nil
  if children.length == 1
    swap_idx = l_child_idx
  else
    swap_idx = prc.call(children[0], children[1]) == -1 ? l_child_idx : r_child_idx
  end

  array[parent_idx], array[swap_idx] = array[swap_idx], parent_value
  heapify_down(array, swap_idx, len, &prc)
end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

   return array if child_idx == 0

   prc ||= Proc.new { |el1, el2| el1 <=> el2 }

  parent_idx = parent_index(child_idx)

  child_value = array[child_idx]
  parent_value = array[parent_idx]

   if prc.call(child_value, parent_value) >= 0
     return array
   else
     array[child_idx], array[parent_idx] = parent_value, child_value
     heapify_up(array, parent_idx, len, &prc)
   end
 end
end
