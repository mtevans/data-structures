require_relative "heap"

class Array
  def heap_sort!
    2.upto(count).each do |heap_el|
      BinaryMinHeap.heapify_up(self, heap_el - 1, heap_el)
    end

    count.downto(2).each do |heap_el|
      self[heap_el - 1], self[0] = self[0], self[heap_el - 1]
      BinaryMinHeap.heapify_down(self, 0, heap_el - 1)
    end

    self.reverse!
  end
end
