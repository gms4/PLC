package codes.EE2.Q1;
class Cliente2Trilhoes {
    //4 threads ate 100
    public static void main(String[] args) {
        Thread [] threads = new Thread[50];
        for (int i = 0; i < 50; i++){    
            int inf = 40000000*i;
            int sup = 40000000*(i+1);
            threads[i] = new Thread2Trilhoes(i, inf, sup);
        }
        for (int i = 0; i < 50; i++) {
            threads[i].start();
        }
        
        System.out.println("A thread main encerrou");
    }
}
