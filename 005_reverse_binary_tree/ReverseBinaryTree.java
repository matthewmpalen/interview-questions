class ReverseBinaryTree {
    public static class Node {
        public int value;
        public Node left;
        public Node right;

        public Node(int v) {
            value = v;
        }

        public String toString() {
            return String.format("Value: %d, Left: %d, Right: %d", 
                value, left.value, right.value);
        }
    }

    private static void solution1(Node root) {
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

    public static void main(String[] args) {
        Node tree = new Node(1);
        tree.left = new Node(2);
        tree.right = new Node(3);
        solution1(tree);

        System.out.println(tree.toString());
    }
}
