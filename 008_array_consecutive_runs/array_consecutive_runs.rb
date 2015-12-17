require "test/unit"
require "test/unit/ui/console/testrunner"


# Finds runs of 3 consecutive positive integers. Returns nil if none are found
def find_consecutive_runs(array)
  return nil unless array.is_a? Array
  return nil if array.length < 3

  output = []
  array.each_with_index do |item, index|
    return nil unless item.is_a?(Integer) && item > 0
    first = item
    second = array[index+1]
    third = array[index+2]

    unless second.nil? || third.nil?
      if (first + 1 == second) && (second + 1 == third)
        output << index
      elsif (first - 1 == second) && (second - 1 == third)
        output << index
      end
    end
  end

  return nil if output.length == 0

  output
end


class RunsTestCase < Test::Unit::TestCase
  def setup
    @float_array = [1.0, 2.0, 3.0]
    @array_length_one = [1]
    @array_length_two = [1, 2]
    @negative_array = [0, 2, -1]
    @valid_input1 = [1, 2, 3]
    @valid_input2 = [3, 2, 1]
    @valid_input3 = [5, 2, 4]
    @valid_input4 = [1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7]
  end

  def test_nil_input
    assert_equal(nil, find_consecutive_runs(nil))
  end

  def test_empty_input
    assert_equal(nil, find_consecutive_runs([]))
  end

  def test_float_input
    assert_equal(nil, find_consecutive_runs(1.0))
  end

  def test_float_array
    assert_equal(nil, find_consecutive_runs(@float_array))
  end

  def test_negative_array
    assert_equal(nil, find_consecutive_runs(@negative_array))
  end

  def test_valid_input1
    assert_equal([0], find_consecutive_runs(@valid_input1))
  end

  def test_valid_input2
    assert_equal([0], find_consecutive_runs(@valid_input2))
  end

  def test_valid_input3
    assert_equal(nil, find_consecutive_runs(@valid_inputs3))
  end
  
  def test_valid_input4
    assert_equal([0, 4, 6, 7], find_consecutive_runs(@valid_input4))
  end
end
