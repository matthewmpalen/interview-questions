package main

import "fmt"

func solution1() {
    for i := 1; i <= 100; i++ {
        if i % (5*3) == 0 {
            fmt.Println("FizzBuzz")
        } else if i % 5 == 0 {
            fmt.Println("Buzz")
        } else if i % 3 == 0 {
            fmt.Println("Fizz")
        } else {
            fmt.Println(i)
        }
    }
}

func main() {
    solution1()
}
