package codes.EE2.Q7;

class ThreadArvoreBusca extends Thread{
  BinarySearchTree tree;

  ThreadArvoreBusca(BinarySearchTree tree){
    this.tree = tree;
  }

  public void run(){
    for (int i = 0; i < 2000; i++) {
      double newNumber = Math.random();
      this.tree.insert(newNumber);
    }
  }
}
