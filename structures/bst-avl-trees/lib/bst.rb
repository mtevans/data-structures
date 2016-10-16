class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  # So a binary tree has a right and a left node.
  # This is the node class,
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end
    BinarySearchTree.insert!(@root, value)
  end

  def find(value)

  end

  def inorder # left -> root -> right

  end

  def postorder # left -> right -> root

  end

  def preorder # root -> left -> right

  end

  def height

  end

  def min

  end

  def max

  end

  def delete(value)

  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end
    node

    # if the node is nill, we want to return a new node, which will set
    # it as either the left or right of the previous node in the recursive
    # insertion process.
  end

  def self.find!(node, value)
    # a.k.a BFS
    return nil unless node
    return node if node.value = value
    if value < node.value
      return BinarySearchTree.find!(node.left, value)
    else
      return BinarySearchTree.find!(node.right, value)
    end

  end

  def self.preorder!(node)
    # dfs
    return [] unless node
    arr = [node.value]
    arr += BinarySearchTree.preorder!(node.left) if node.left
    arr += BinarySearchTree.preorder!(node.right) if node.right

    arr
  end

  def self.inorder!(node)
    return [] unless node
    arr = []
    arr += BinarySearchTree.preorder!(node.left) if node.left
    arr << node.value
    arr += BinarySearchTree.preorder!(node.right) if node.right
  end

  def self.postorder!(node)
    return [] unless node
    arr = []
    arr += BinarySearchTree.preorder!(node.left) if node.left
    arr += BinarySearchTree.preorder!(node.right) if node.right
    arr << node.value

    arr
  end

  def self.height!(node)
    return -1 unless node
    1 + [BinarySearchTree.height!(node.left), BinarySearchTree.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    return node unless node.right
    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left  = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if value <  node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.right
      # the above is if the node you want to delete only has one child

      t = node
      node = t.right.min
      node.right = BinarySearchTree.delete_min!(t.right)
      node.left = t.left
    end

    node
  end
end
