package codes.EE2;

import java.util.*;


class ImpressaoValoresPrimos extends Thread {
    int inf, sup, id;

    ImpressaoValoresPrimos(int idd, int i, int j) {
        this.id = idd;
        this.inf = i;
        this.sup = j;
    }

    public boolean isPrimo (int n) {
      if (n == 2){
        return true;
      }
      for (int i = 2; i < n; i++){
        if (n % i == 0) {
          return false;
        }
      }
      return true;
    }

    public void run() {
        int i;
        //int contador = 0;
        for (i = inf; i < sup; i++) {
          if (isPrimo(i)){
            System.out.println("Thread: " + this.id + " - É Primo: " + i);
          }
        }
    }
}

class Main {
    static int inf, sup;

    public static void main(String args[]) {
        try (Scanner scanner = new Scanner(System.in)) {
            int n_primos = scanner.nextInt();
            int n_threads = scanner.nextInt();
     
            Thread[] thr = new Thread[n_threads];
            inf = 2;
            int value = n_primos/n_threads;
            sup = value;
            int i;
            for (i = 0; i < n_threads; i++) {
                thr[i] = new ImpressaoValoresPrimos(i, inf, sup);
                inf += value;
                sup += value;
            }

            for (i = 0; i < n_threads; i++) {
                thr[i].start();

                
                try {
                  thr[i].join();
                } catch (Exception e) {
                 System.out.println(e);
                }

            }
        }

        System.out.println("A thread main encerrou");
    }
}