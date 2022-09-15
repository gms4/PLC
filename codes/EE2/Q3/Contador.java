package codes.EE2.Q3;
class Contador{
  private int valorAtual;

  Contador (){
    this.valorAtual = 0;
  }

  public synchronized void incrementar (){
    this.valorAtual++;
  }

  public synchronized int getValue (){
    return this.valorAtual;
  }

}