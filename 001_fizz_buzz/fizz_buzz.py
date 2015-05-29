def solution1():
    """
    Textbook solution to FizzBuzz
    """
    for i in range(1, 101):
        if i % (5 * 3) == 0:
            print('FizzBuzz')
        elif i % 5 == 0:
            print('Buzz')
        elif i % 3 == 0:
            print('Fizz')
        else:
            print(i)

def solution2():
    """
    Somewhat inscrutable one-liner. Uses clever slices of the string to 
    print the correct answer.
    """
    for i in range(1, 101):
        print 'FizzBuzz'[i * i % 3 * 4:8 - -i ** 4 % 5] or i

if __name__ == '__main__':
    solution1()
    solution2()
