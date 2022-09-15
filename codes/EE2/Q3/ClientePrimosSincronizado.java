package codes.EE2.Q3;

class ClientePrimosSincronizado {
    
    public static void main(String[] args) {
      Thread[] thr = new Thread[5];
      Contador contador = new Contador();

      for (int i = 0; i < 5; i++) {
        thr[i] = new ImprimePrimosSincronizado(i, contador);
      }

      for (int i = 0; i < 5; i++) {
        thr[i].start();
      }
    }
}