package codes.EE2.EstudoEE2;

import java.util.Random;

public class produtorConsumidor {

    public static void main(String[] args) {
        Queue q = new Queue();
        Thread prodThread = new Thread(new Producer(q));
        prodThread.start();
        Thread consThread = new Thread(new Consumer(q));
        consThread.start();

    }
    
    public static class Queue {
        private int value;
        private boolean empty = true;

        public synchronized int take() {
            while (this.empty) {
                try {
                    wait();
                } catch (InterruptedException e) {}
            }
            this.empty = true;
            notifyAll();
            return value;
        } 

        public synchronized void put (int value) {
            while (!this.empty) {
                try {
                    wait();
                } catch (InterruptedException e) {}
            }
            this.empty = false;
            this.value = value;
            notifyAll();
        }

    }

    public static class Producer implements Runnable {
        private Queue queue;

        public Producer (Queue q) {
            this.queue = q;
        }

        @Override
        public void run() {
            // TODO Auto-generated method stub
            Random random = new Random();
            while (true) {
                int newValue = random.nextInt(1000);
                this.queue.put(newValue);
                try {
                    Thread.sleep(random.nextInt(5) * 1000);
                } catch (InterruptedException e) {}
            }
        }
    }

    public static class Consumer implements Runnable {
        private Queue queue;

        public Consumer(Queue q) {
            this.queue = q;
        }

        @Override
        public void run() {
            // TODO Auto-generated method stub
            Random random = new Random();
            while (true) {
                int value = this.queue.take();
                System.out.println(value);
                try {
                    Thread.sleep(random.nextInt(5) * 1000);
                } catch (InterruptedException e) {}
            }
        }
    }
    
}
