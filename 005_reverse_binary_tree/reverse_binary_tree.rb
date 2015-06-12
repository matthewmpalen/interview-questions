class Node
  attr_accessor :value, :left, :right

  def initialize(v, l=nil, r=nil)
    @value = v
    @left = l
    @right = r
  end

  def to_s
    "Value: #{@value}, Left: #{@left.value}, Right: #{@right.value}"
  end
end

def solution1(root)
  # Recursively mutates the original tree
  return unless root

  tmp = root.left
  root.left = root.right
  root.right = tmp

  solution1(root.left)
  solution1(root.right)
end

def solution2(root)
  # Recursively creates a new tree
  return nil unless root
  return Node.new(root.value, solution2(root.right), solution2(root.left))
end

if __FILE__ == $0
  tree = Node.new(1)
  tree.left = Node.new(2)
  tree.right = Node.new(3)
  solution1(tree)

  puts tree
  puts solution2(tree)
end
