//this is a min heap
function Heap() {
  // first entry is null so indexing and parent children realtionship works easily
  this.heap = [null, 2,5,3,9,6,11,4,17,10,8];
  // removeMin(), output should be [3,5,4,9,6,11,8,17,10]
  // insert(2), output should be [2,2,3,9,5,11,4,17,10,8,6]
}

Heap.prototype.min = function() {
  if (this.heap.length > 1) {
    return this.heap[1];
  }
}

Heap.prototype.insert = function(num) {
  this.heap.push(num);
  var child_idx = this.heap.length - 1;
  var parent_idx = Math.floor((this.heap.length -1) / 2);
  if (num < this.heap[num]){
    this.heapifyUp(child_idx, parent_idx)
  }
  console.log(this.heap);
  return num;
}

Heap.prototype.heapifyUp = function(child_idx, parent_idx) { // swapping up the tree
  var heap = this.heap;
  var hold = heap[child_idx];
  heap[child_idx] = heap[parent_idx];
  heap[parent_idx] = hold;
  var parentsParent_idx = Math.floor(parent_idx / 2);
  if (heap[parent_idx] < heap[parentsParent_idx]) { // do we need to heapify up again.
    this.heapifyUp(parent_idx, parentsParent_idx);
  }
}

Heap.prototype.removeMin = function() {
  var heap = this.heap;
  var minToReturn = this.min();
  heap[1] = heap[heap.length - 1] ;// switch root with the last leaf node
  heap.splice(-1); // remove last node as it the old root we want to delete
  var root_idx = 1;
  this.heapifyDown(root_idx);
  console.log(this.heap);
}

Heap.prototype.heapifyDown = function(parent_idx) { // swapping down the tree
  var heap = this.heap;
  var leftChild_idx = parent_idx * 2;
  var rightChild_idx = parent_idx * 2 + 1;
  var validChildren = {};
  if (heap[leftChild_idx]) { // if we have a valid left child
    validChildren.left = {idx: leftChild_idx, value: heap[leftChild_idx] };
  }
  if (heap[rightChild_idx]) { // if we have a valid right child
    validChildren.right = {idx: rightChild_idx, value: heap[rightChild_idx] };
  }
  if (Object.keys(validChildren).length === 1) { // only one valid child
    var hold = heap[parent_idx];
    if (validChildren.right) {
      this.heapifyDownSwapHelper(parent_idx, validChildren.right.idx);
    } else {
      this.heapifyDownSwapHelper(parent_idx, validChildren.left.idx);
    }
  } else if (Object.keys(validChildren).length > 1) { // two validChildren, so find the smaller of the two
    if (validChildren.right.value < validChildren.left.value) {
      this.heapifyDownSwapHelper(parent_idx, validChildren.right.idx);
    } else {
      this.heapifyDownSwapHelper(parent_idx, validChildren.left.idx);
    }
  }
}

Heap.prototype.heapifyDownSwapHelper = function(parent_idx, child_idx) {
  var heap = this.heap;
  var hold = heap[parent_idx];
  heap[parent_idx] = heap[child_idx];
  heap[child_idx] = hold;
  this.heapifyDown(child_idx);
}




var x =  new Heap;

x.insert(2);
x.removeMin();
