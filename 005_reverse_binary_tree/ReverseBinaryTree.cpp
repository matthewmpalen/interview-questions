#include <iostream>
#include <string>

#include <cstdio>

using namespace std;

struct Node {
    int value;
    Node* left;
    Node* right;

    Node(int v): value(v) {};
    Node(int v, Node* l, Node* r): value(v), left(l), right(r) {};

    string toString() {
        int size = 100;
        char buffer[size];
        snprintf(buffer, size, "Value: %d, Left: %d, Right: %d", 
            value, left->value, right->value);
        return string(buffer);
    }
};

class BinaryTree {
public:
    BinaryTree(Node* node): root(node) {};
    ~BinaryTree() {
        destroyTree();
    };

    Node* root;

    void destroyTree() {
        destroyTree(root);
    }

    string toString() {
        return root->toString();
    }
private:
    void destroyTree(Node* node) {
        if (nullptr != node) {
            destroyTree(node->left);
            destroyTree(node->right);
            delete node;
        }
    }
};

void solution1(Node* root) {
    if (nullptr == root) {
        return;
    }

    Node* tmp = root->left;
    root->left = root->right;
    root->right = tmp;

    if (nullptr != root->left) {
        solution1(root->left);
    }

    if (nullptr != root->right) {
        solution1(root->right);
    }
}

int main() {
    Node* node = new Node(1);
    node->left = new Node(2);
    node->right = new Node(3);
    BinaryTree* tree = new BinaryTree(node);

    cout << tree->toString() << endl;

    solution1(tree->root);
    cout << tree->toString() << endl;

    delete tree;

    return 0; 
}
