def solution1(string):
    """
    Splits string into an array of words, reverses the order of words, 
    then creates a new string by joining the words together.
    """
    return ' '.join(string.split(' ')[::-1])

if __name__ == '__main__':
    test_string = 'How now brown cow'
    print(solution1(test_string))
