#include <iostream>
 
using namespace std;

/*
 * Textbook solution for FizzBuzz
 */
void solution1() {
    for (int i = 1; i <= 100; i++) {
        if ((i % (5 * 3)) == 0) {
            cout << "FizzBuzz" << endl;
        } else if (i % 5 == 0) {
            cout << "Buzz" << endl;
        } else if (i % 3 == 0) {
            cout << "Fizz" << endl;
        } else {
            cout << i << endl;
        }
    }
}

int main() {
    solution1();

    return 0;
}
