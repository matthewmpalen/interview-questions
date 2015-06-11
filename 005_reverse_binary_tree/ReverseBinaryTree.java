class ReverseBinaryTree {
    public static class Node {
        private int value;
        private Node left;
        private Node right;

        public Node(int v) {
            value = v;
        }

        public int getValue() {
            return value;
        }

        public void setValue(int v) {
            value = v;
        }

        public Node getLeft() {
            return left;
        }

        public void setLeft(Node l) {
            left = l;
        }

        public Node getRight() {
            return right;
        }

        public void setRight(Node r) {
            right = r;
        }

        public String toString() {
            return String.format("Value: %d, Left: %d, Right: %d", value, left.getValue(), right.getValue());
        }
    }

    private static void solution1(Node root) {
        Node tmp = root.getLeft();
        root.setLeft(root.getRight());
        root.setRight(tmp);

        if (null != root.getLeft()) {
            solution1(root.getLeft());
        }

        if (null != root.getRight()) {
            solution1(root.getRight());
        }
    }

    public static void main(String[] args) {
        Node tree = new Node(1);
        tree.setLeft(new Node(2));
        tree.setRight(new Node(3));
        solution1(tree);

        System.out.println(tree.toString());
    }
}
