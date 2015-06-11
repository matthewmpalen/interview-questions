class Node(object):
    def __init__(self, v):
        self.value = v
        self.left = None
        self.right = None

    def __str__(self):
        return 'Value: %s, Left: %s, Right: %s' % (
            self.value, self.left.value, self.right.value
        )

def solution1(root):
    """
    Mutates the original tree
    """
    if not root:
        return

    tmp = root.left
    root.left = root.right
    root.right = tmp

    if root.left:
        solution1(root.left)

    if root.right:
        solution1(root.right)

def solution2(root):
    """
    Creates a new tree
    """
    if not root:
        return None

    return Node(root.value, solution2(root.right), solution2(root.left))

if __name__ == '__main__':
    tree = Node(1)
    tree.left = Node(2)
    tree.right = Node(3)
    solution1(tree)

    print(tree)
    print(solution2(tree))
