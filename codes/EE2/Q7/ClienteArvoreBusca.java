package codes.EE2.Q7;

class ClienteArvoreBusca {

  public static void main(String[] args) {
    Thread[] thr = new Thread[50];
    BinarySearchTree tree = new BinarySearchTree();

    for (int i = 0; i < 50; i++){
      thr[i] = new ThreadArvoreBusca(tree);
    } 

    for (int i = 0; i < 50; i++){
      thr[i].start();
    } 

    //Wait until all threads finish
    for (int i = 0; i < 50; i++){
      try {
        thr[i].join();
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }

    System.out.println(tree.length()); 
  }
}
