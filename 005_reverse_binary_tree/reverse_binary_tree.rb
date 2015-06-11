class Node
  attr_accessor :value, :left, :right

  def initialize(v)
    @value = v
    @left = nil
    @right = nil
  end

  def to_s
    "Value: #{@value}, Left: #{@left.value}, Right: #{@right.value}"
  end
end

def solution1(root)
  tmp = root.left
  root.left = root.right
  root.right = tmp

  solution1(root.left) if root.left
  solution1(root.right) if root.right
end

if __FILE__ == $0
  tree = Node.new(1)
  tree.left = Node.new(2)
  tree.right = Node.new(3)
  solution1(tree)

  puts tree
end
