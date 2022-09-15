package codes.EE2.Q7;

// Peguei o Código do Geeks for Geeks
class BinarySearchTree {

  /*
   * Class containing left
   * and right child of current node
   * and key value
   */
  class Node {
    double key;
    Node left, right;

    public Node(double item) {
      key = item;
      left = right = null;
    }
  }

  // Root of BST
  Node root;

  // Constructor
  BinarySearchTree() {
    root = null;
  }

  BinarySearchTree(double value) {
    root = new Node(value);
  }

  // This method mainly calls insertRec()
  synchronized void insert(double key) {
    root = insertRec(root, key);
  }

  /*
   * A recursive function to
   * insert a new key in BST
   */
  Node insertRec(Node root, double key) {

    /*
     * If the tree is empty,
     * return a new node
     */
    if (root == null) {
      root = new Node(key);
      return root;
    }

    /* Otherwise, recur down the tree */
    else if (key < root.key)
      root.left = insertRec(root.left, key);
    else if (key > root.key)
      root.right = insertRec(root.right, key);

    /* return the (unchanged) node pointer */
    return root;
  }

  public int length() {
    return lengthRec(root);
  }

  public int lengthRec(Node root) {
    if (root != null) {
      return lengthRec(root.left) + lengthRec(root.right) + 1;
    }else{
      return 0;
    }
  }
}
