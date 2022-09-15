package codes.EE2.Q3;

class ImprimePrimosSincronizado extends Thread{
  int id;
  Contador contador;

  ImprimePrimosSincronizado(int id, Contador cnt){
    this.id = id;
    this.contador = cnt;
  }

  public void run (){
      int valorAtual;
    for (int i = 0; i < 5; i++) {
      valorAtual = this.contador.getValue();
      this.contador.incrementar();
      System.out.println("Thread " + this.id + " - Valor: " + valorAtual);
    }
  }
}