package codes.EE2.EstudoEE2;

import java.util.Random;
import java.util.concurrent.atomic.*;

public class threadJoin {
    public static void main(String[] args) {
        // AtomicInteger ai = new AtomicInteger(0);
        AtomicIntegerArray aa = new AtomicIntegerArray(20);
        
        // (new Thread(new Contador("Cont. 1", ai))).start();
        // (new Thread(new Contador("Cont. 2", ai))).start();
        // (new Thread(new Contador("Cont. 3", ai))).start();
        // (new Thread(new Contador("Cont. 4", ai))).start();
        // (new Thread(new Contador("Cont. 5", ai))).start();

        Thread t1 = new Thread(new Marcador(1, aa));
        Thread t2 = new Thread(new Marcador(2, aa));

        t1.start();
        t2.start();
        // t3.start();
        // t4.start();
        // t5.start();

        try {
            t1.join();
            t2.join();
            // t3.join();
            // t4.join();
            // t5.join();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        for (int i = 0; i < aa.length(); i++) {
            System.out.println(aa.get(i) + " ");
        }

        System.out.println();
        System.out.println("Main encerrou!");
        
    }

    public static class Marcador implements Runnable {
        private int id;
        private AtomicIntegerArray aa;
        private int index;
        private int arraySize;

        public Marcador(int id, AtomicIntegerArray aa) {
            this.id = id;
            this.aa = aa;
            this.index = 0;
            this.arraySize = aa.length();
        }

        @Override
        public void run() {
            // TODO Auto-generated method stub
            Random random = new Random();

            for (int index = 0; index < this.aa.length(); index++) {
                System.out.println("Thread " + this.id + ": " + index);
               this.aa.compareAndExchange(index, 0, this.id);
               try {
                Thread.sleep(random.nextInt(5) * 1000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
        }
    }

    // public static class Contador implements Runnable {
    //     private String name;
    //     private AtomicInteger ai;

    //     public Contador(String name, AtomicInteger ai) {
    //         this.name = name;
    //         this.ai = ai;
    //     }

    //     @Override
    //     public void run() {
    //         // TODO Auto-generated method stub
    //         Random random = new Random();
    //         while (true) {
    //             int value = this.ai.incrementAndGet();
    //             System.out.println(this.name + ": " + value);
    //             try {
    //                 Thread.sleep(random.nextInt(5) * 1000);
    //             } catch (InterruptedException e) {}
    //         }
    //     }
    // }

}
