function BSTNode(value){
  this.value = value
  this.right = null
  this.left = null
  this.parent = null
}

function BinarySearchTree(rootNode){
  this.root = rootNode
}

BinarySearchTree.prototype.insert = function(value){
  var newNode = new BSTNode(value)
  if(this.root === null){
    this.root = newNode
    return this.root
  }
  var currentNode = this.root
  var searching = true
  while (searching) {
    if(value <= currentNode.value){
      if(currentNode.left){
        currentNode = currentNode.left
      } else {
        currentNode.left = newNode
        newNode.parent = currentNode
        searching = false
      }
    } else {
      if(currentNode.right){
        currentNode = currentNode.right
      } else {
        currentNode.right = newNode
        newNode.parent = currentNode
        searching = false
      }
    }
  }
  return newNode
}


BinarySearchTree.prototype.find = function(value){
  var currentNode = this.root
  while(currentNode){
    if(value === currentNode.value){
      return currentNode
    } else if (value < currentNode.value){
      currentNode = currentNode.left
    } else {
      currentNode = currentNode.right
    }
  }
  return null
}

BinarySearchTree.prototype.first = function(){

}

BinarySearchTree.prototype.last = function(){

}

BinarySearchTree.prototype.remove = function(value){

}


var test = new BinarySearchTree(new BSTNode(18))
test.insert(12)
test.insert(25)
test.insert(4)
test.insert(15)
test.insert(25)
test.insert(28)
test.insert(1)
test.insert(13)
test.insert(17)
test.insert(29)
test.insert(3)
test.insert(2)
test.insert(14)

console.log(test.find(1).right.value) // returns 28
