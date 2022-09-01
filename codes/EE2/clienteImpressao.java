// AULA 01/09

package codes.EE2;

class ClienteImpressao {
    static int inf, sup;

    public static void main(String args[]) {
        Thread[] thr = new Thread[5];
        inf = 0;
        sup = 100;
        int i;

        for (i = 0; i < 5; i++) {
            thr[i] = new ImpressaoValores(i, inf, sup);
            inf += 100;
            sup += 100;
        }

        for (i = 0; i < 5; i++) {
            thr[i].start();
            // main vai esperar que todas as threads terminem
            // o output são as threads ordenadas (thread 0 valor 1, thread 0 valor 2... thread 4 valor 499)
            // comentando aqui e deixando o de baixo descomentado faz com que as threads não fiquem ordenadas
            // mas os valores de cada thread permanecerão ordenados
            try {
                thr[i].join();
             } catch (Exception e) {
                System.out.println(e);
             }
             

        }
        // comentando aqui e deixando o de cima descomentado, a thread fica toda certinha
        // for (i = 0; i < 5; i++) {

        //     try {
        //         thr[i].join();
        //     } catch (Exception e) {
        //         System.out.println(e);
        //     }

        // }

        System.out.println("A thread main encerrou");
    }
}