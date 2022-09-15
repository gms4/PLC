package codes.EE2.Q2;
class ThreadNumPrimos implements Runnable{
    int id;
    int inf;
    int sup;

    ThreadNumPrimos (int id, int inf, int sup){
        this.id = id;
        this.inf = inf;
        this.sup = sup;
    }

    public void run(){
        for (int i = inf; i < sup; i++){
            if (isPrime(i))
              System.out.println("Thread " + this.id + " - " + i);
        }
    }

    static boolean isPrime(int n) //peguei o codigo do geeks for
    {
 
        // Check if number is less than
        // equal to 1
        if (n <= 1)
            return false;
 
        // Check if number is 2
        else if (n == 2)
            return true;
 
        // Check if n is a multiple of 2
        else if (n % 2 == 0)
            return false;
 
        // If not, then just check the odds
        for (int i = 3; i <= Math.sqrt(n); i += 2)
        {
            if (n % i == 0)
                return false;
        }
        return true;
    }
}
