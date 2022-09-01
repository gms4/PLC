package codes.EE2;

public class HelloThread extends Thread {
    
    public void run() {
        System.out.println("Hi from a thread.");
    }

    public static void main (String args[]) {
        (new HelloThread()).start();
    }

}

/* public class HelloRunnable implements Runnable {

    public void run() {
        System.out.println("Hi from a thread.");
    }

    public static void main (String args[]) {
        (new Thread(new HelloRunnable())).start();
    }
} */
