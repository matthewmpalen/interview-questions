class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    "#{value}"
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(element)
    if @data.nil?
      @data = LinkedListNode.new(element)
    else
      @data = LinkedListNode.new(element, @data)
    end
  end

  def pop
    value = @data.value
    @data = @data.next_node
    value
  end
end

def print_values(list_node)
  return if list_node.nil?

  print "#{list_node.value} --> "
  
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list)
  return nil unless list
  raise ArgumentError, "Expected LinkedListNode" \
    unless list.is_a?(LinkedListNode)

  stack = Stack.new

  while list
    stack.push(list.value)
    list = list.next_node
  end


  return stack.data
end

def reverse_list_mutate(list, previous=nil)
  return nil unless list
  raise ArgumentError, "Expected LinkedListNode" \
    unless list.is_a?(LinkedListNode)

  next_node = list.next_node
  list.next_node = previous
  return list if next_node.nil?

  reverse_list_mutate(next_node, list)
end

def solution1
  # Reverse a linked list without mutation
  puts "Solution 1"

  node1 = LinkedListNode.new(37)
  node2 = LinkedListNode.new(99, node1)
  node3 = LinkedListNode.new(12, node2)

  print_values(node3)
  
  puts "-------"

  rev_list = reverse_list(node3)

  print_values(rev_list)
end

def solution2
  # Reverse a linked list with mutation
  puts "Solution 2"

  node1 = LinkedListNode.new(37)
  node2 = LinkedListNode.new(99, node1)
  node3 = LinkedListNode.new(12, node2)

  print_values(node3)
  
  puts "-------"

  rev_list = reverse_list_mutate(node3)

  print_values(rev_list)
end

if __FILE__ == $0
  solution1
  solution2
end
