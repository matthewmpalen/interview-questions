def solution1
  # Textbook solution to FizzBuzz
  (1..100).each do |i|
    if i % (5 * 3) == 0
      puts "FizzBuzz"
    elsif i % 5 == 0
      puts "Buzz"
    elsif i % 3 == 0
      puts "Fizz"
    else
      puts i
    end
  end
end

def solution2
  # One-liner solution using ternary operators.
  for i in 1..100
    puts (i % 3 == 0) ? ((i % 5 == 0) ? "FizzBuzz" : "Fizz") : ((i % 5) == 0 ? "Buzz" : i)
  end
end

if __FILE__ == $0
  solution1
  solution2
end
