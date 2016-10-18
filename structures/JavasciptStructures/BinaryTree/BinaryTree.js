function BSTNode(value, parent){
  this.value = value
  this.parent = parent
  this.left = null
  this.right = null
}

function BinarySearchTree(rootNode){
  this.root = rootNode
  this.size = 1 // number of nodes
}

BinarySearchTree.prototype.find = function(value){
  debugger
  var node = this.root
  if(node === undefined){
    return null
  }
  while(node){
    if(node.value === value){
      return node
    }
    if(value > node.value){
      node = node.right
    } else {
      node = node.left
    }
  }
  return null
}

BinarySearchTree.prototype.insert = function(value){
    var currentNode = this.root

    if(currentNode === undefined){
      this.root = new BSTNode(value)
      return this.root
    }
    var searching = true
    while(searching){
      if(value > currentNode.value){
        if(currentNode.right){
          currentNode = currentNode.right
        } else {
          currentNode.right = new BSTNode(value, currentNode)
          searching = false
        }
      } else {
        if(currentNode.left){
          currentNode = currentNode.left
        } else {
          currentNode.left = new BSTNode(value, currentNode)
          searching = false
        }
      }
    }
}
 // equivalent of min
BinarySearchTree.prototype.first = function(currentNode){
  if(!currentNode){
    currentNode = this.root
  }
  while(currentNode){
    if(currentNode.left){
      currentNode = currentNode.left
    } else {
      return currentNode
    }
  }
}
// equivalent of max
BinarySearchTree.prototype.last = function(currentNode){
  if(!currentNode){
    currentNode = this.root
  }
  while(currentNode){
    if(currentNode.right){
      currentNode = currentNode.right
    } else {
      return currentNode
    }
  }
}

BinarySearchTree.prototype.delete = function(value){

   var nodeToDelete = this.find(value)
   if(nodeToDelete === null){
     return null
   }
   if(nodeToDelete.right && nodeToDelete.left){
     console.log("got here")
     this.deleteWithTwoChildren(nodeToDelete)
   } else if(!nodeToDelete.right && !nodeToDelete.left){
     this.deleteWithNoChild(nodeToDelete)
   } else {
     this.deleteWithOneChild(nodeToDelete)
   }
}

// finds smallest node in right subtree. Replace node you want to deletes key and value
// with the one we found. then delete the node we found, it will either have no children or one child.

BinarySearchTree.prototype.deleteWithTwoChildren = function(node){
  var nodeToSwitch = this.first(node.right) // finds smallest node in right subtree
  node.value = nodeToSwitch.value
  if(!node.right && !node.left){
    this.deleteWithNoChild(nodeToSwitch)
  } else {
    this.deleteWithOneChild(nodeToSwitch)
  }
}


// find whether single child is right or left and replace node to be deleted with that one.
BinarySearchTree.prototype.deleteWithOneChild = function(node){
  var parent = node.parent
  if(parent.right === node){
    if(node.right){
      parent.right = node.right
    } else {
      parent.right = node.left
    }
  } else {
    if(node.right){
      parent.left = node.right
    } else {
      parent.left = node.left
    }
  }
  node.parent = null
  node.left = null
  node.right = null
}

//if it has nochildren just cut off connection to parent node and vice versa.
BinarySearchTree.prototype.deleteWithNoChild = function(node){
  var parent = node.parent
  if(parent.right === node){
    parent.right === null
  } else {
    parent.left === null
  }
  node.parent === null
  return node.value
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
console.log(test.root.right.right.value) // returns 28
console.log(test.root.left.left.value)// returns 4

test.delete(25)
// console.log(test.root.right.left.value) // return 25
