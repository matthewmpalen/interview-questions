class ReverseBinaryTree {
    public static class Node {
        public int value;
        public Node left;
        public Node right;

        public Node(int v) {
            value = v;
        }
        
        public Node(int v, Node l, Node r) {
            value = v;
            left = l;
            right = r;
        }

        public String toString() {
            return String.format("Value: %d, Left: %d, Right: %d", 
                value, left.value, right.value);
        }
    }

    /*
     * Recursively mutates the original tree
     */
    private static void solution1(Node root) {
        if (null == root) {
            return;
        }

        Node tmp = root.left;
        root.left = root.right;
        root.right = tmp;

        if (null != root.left) {
            solution1(root.left);
        }

        if (null != root.right) {
            solution1(root.right);
        }
    }

    /*
     * Recursively creates a new tree
     */
    private static Node solution2(Node root) {
        if (null == root) {
            return null;
        }

        return new Node(root.value, solution2(root.right), 
            solution2(root.left));
    }

    public static void main(String[] args) {
        Node tree = new Node(1);
        tree.left = new Node(2);
        tree.right = new Node(3);
        solution1(tree);

        System.out.println(tree.toString());
        System.out.println(solution2(tree).toString());
    }
}
