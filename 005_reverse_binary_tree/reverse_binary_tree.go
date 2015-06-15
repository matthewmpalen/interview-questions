package main

import (
    "fmt"
)

type Node struct {
    value int
    left *Node
    right *Node
}

func New(v int) *Node {
    n := new(Node)
    n.value = v
    return n
}

func New1(v int, l *Node, r *Node) *Node {
    n := new(Node)
    n.value = v
    n.left = l
    n.right = r
    return n
}

func (node *Node) String() string {
    return fmt.Sprintf("Value: %d, Left: %d, Right: %d", 
        node.value, node.left.value, node.right.value)
}

/*
 * Recursively mutates the original tree
 */
func solution1(node *Node) {
    if node == nil {
        return
    }

    tmp := node.left
    node.left = node.right
    node.right = tmp

    solution1(node.left)
    solution1(node.right)
}

/*
 * Recursively creates a new tree
 */
func solution2(node *Node) *Node {
    if node == nil {
        return nil
    }

    return New1(node.value, solution2(node.right), solution2(node.left))
}

func main() {
    tree := New(1)
    tree.left = New(2)
    tree.right = New(3)
    solution1(tree)
    
    fmt.Println(tree)
    fmt.Println(solution2(tree))
}
