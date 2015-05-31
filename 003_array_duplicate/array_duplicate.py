from collections import defaultdict

def solution1(array):
    # Simple solution using a hashmap
    int_map = defaultdict(int)
    for i in array:
        int_map[i] += 1

        if int_map[i] == 2:
            return i

    return None

if __name__ == '__main__':
    test_array = [i for i in range(1, 1000001)]
    test_array[25853] = 4

    print(solution1(test_array))
