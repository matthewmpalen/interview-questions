def solution1(string)
  return string.split(' ').reverse.join(' ')
end

if __FILE__ == $0
  test_string = "How now brown cow"
  puts solution1(test_string)
end
