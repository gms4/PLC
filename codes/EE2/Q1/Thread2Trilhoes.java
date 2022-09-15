package codes.EE2.Q1;
class Thread2Trilhoes extends Thread {
    int id;
    int inf;
    int sup;

    Thread2Trilhoes (int id, int inf, int sup){
        this.id = id;
        this.inf = inf;
        this.sup = sup;
    }

    public void run(){
        for (int i = inf; i < this.sup; i++){
            System.out.println("Thread " + this.id + " - " + i);
        }
    }
}