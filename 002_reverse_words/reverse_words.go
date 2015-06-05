package main

import (
    "fmt"
    "strings"
)

func solution1(input string) string {
    words := strings.Split(input, " ")
    
    for i, j := 0, len(words) - 1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }

    return strings.Join(words, " ")
}

func main() {
    test_string := "How now brown cow"
    fmt.Println(solution1(test_string))
}
