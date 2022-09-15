package codes.EE2.Q2;
import java.util.Scanner;

class ClienteNumPrimos{
    public static void main(String[] args) {
        int qtdThreads, max;
        Scanner in = new Scanner(System.in);

        try {
          System.out.println("Escreva o maior numero que será testado como primo");
          max = in.nextInt();

          System.out.println("Escreva as quantidades de Threads desejada");
          qtdThreads = in.nextInt();
        } finally {
          in.close();
        }
        
        Thread[] threads = new Thread [qtdThreads];

        for (int i = 0; i < qtdThreads; i++){//37/7=5
          int inf = (max/qtdThreads)*i;
          int sup = (max/qtdThreads)*(i+1);

          if (i == qtdThreads-1) {
              sup = max+1;
          }

          threads[i] = new Thread(new ThreadNumPrimos(i, inf, sup));
        }

        for (int i = 0; i < qtdThreads; i++) {
          threads[i].start();
        }

        System.out.println("A Thread Main terminou suas atividades");
    }
}