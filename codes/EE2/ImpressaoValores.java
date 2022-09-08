// AULA 01/09

package codes.EE2;

class ImpressaoValores extends Thread {
    int inf, sup, id;

    ImpressaoValores(int idd, int i, int j) {
        this.id = idd;
        this.inf = i;
        this.sup = j;
    }

    public void run() {
        int i;
        //int contador = 0;
        for (i = inf; i < sup; i++) {
            //contador = i;
            System.out.println("Thread: " + this.id + " - Valor: " + i);
        }
    }

}


