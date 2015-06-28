require "test/unit"
require "test/unit/ui/console/testrunner"

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

def is_infinite(list)
  return false unless list
  raise ArgumentError, "Expected LinkedListNode" \
    unless list.is_a?(LinkedListNode)

  tortoise = list
  hare = list.next_node

  until hare.nil?
    if hare == tortoise
      return true
    elsif hare.next_node == nil
      return false
    else
      tortoise = tortoise.next_node
      hare = hare.next_node.next_node
    end
  end

  return false
end

class InfiniteLinkedListTestCase < Test::Unit::TestCase
  def setup
    @node1 = LinkedListNode.new(1)
    @node2 = LinkedListNode.new(2, @node1)
    @node3 = LinkedListNode.new(3, @node2)
    
    @node4 = LinkedListNode.new(37)
    @node5 = LinkedListNode.new(99, @node4)
    @node6 = LinkedListNode.new(12, @node5)
    @node4.next_node = @node6
  end

  def test_finite_linkedlist
    assert_equal(false, is_infinite(@node1))
  end

  def test_infinite_linkedlist
    assert_equal(true, is_infinite(@node4))
  end

  def test_nil_linkedlist
    assert_equal(false, is_infinite(nil))
  end

  def test_argument
    assert_raise ArgumentError do
      is_infinite(123)
    end
  end
end

if __FILE__ == $0
  Test::Unit::UI::Console::TestRunner.run(InfiniteLinkedListTestCase)
end
