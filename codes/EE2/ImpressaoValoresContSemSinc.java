package codes.EE2;

class ImpressaoContSemSinc {
    static int inf, sup;

    public static void main(String args[]) {
        Thread[] thr = new Thread[5];
        // inf = 0;
        // sup = 5;
        int i;
        // final Contador c = new Contador();

        for (i = 0; i < 5; i++) {
            thr [i] = new ImpressaoValoresContSemSinc(i); // thr[i] = new ImpressaoValoresContSemSinc(c, i, inf, sup);
            // inf += 100;
            // sup += 100;
        }

        for (i = 0; i < 5; i++) {
            thr[i].start();
        }

        for (i = 0; i < 5; i++) {
            try {
                thr[i].join();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

    }
}

class ImpressaoValoresContSemSinc extends Thread {
    int inf, sup, id;
    int contador; // Contador contador;

    ImpressaoValoresContSemSinc(int idd) { // ImpressaoValoresContSemSinc(Contador ctd, int idd, int i, int j) {
        this.id = idd;
        // this.inf = i;
        // this.sup = j;
        this.contador = 0; //this.contador = ctd;
    }

    public void run() {
        int i;

        for (i = 0; i < 100; i++) { //for (i = inf; i <= sup; i++) {
            // synchronized (contador) {
            this.contador++; //this.contador.incrementar();
            System.out.println("Thread: " + this.id + " - Valor: " + this.contador);
            // }
        }
    }
}

class Contador {
    private int contador;

    Contador() {
        this.contador = 0;
    }

    public int getIncrementar() {
        int value;
        value = this.contador;
        this.contador++;
        return value;
    }

    public void incrementar() {
        synchronized (this) {
            this.contador++;
        }
    }

    public int getContador() {
       // synchronized (this) {
            return this.contador;
       // }
    }

}
