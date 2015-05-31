def solution1(array)
  # Simple solution using a hashmap
  int_map = Hash.new(0)
  array.each do |i|
    int_map[i] += 1

    return i if int_map[i] == 2
  end

  return nil
end

if __FILE__ == $0
  test_array = [*1..1000000]
  test_array[25853] = 4

  puts solution1(test_array)
end
