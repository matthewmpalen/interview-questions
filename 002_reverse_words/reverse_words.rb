def solution1(string)
  return string.split(' ').reverse.join(' ')
end

if __FILE__ == $0
  puts solution1('How now brown cow')
end
