// Guilherme Macedo de Souza (gms4)

import java.util.*;
import java.util.concurrent.atomic.*;

class Questao1 {
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("Digite a quantidade de players: ");
        int playerCount = in.nextInt();

        ArrayList<Player> players = new ArrayList<Player>(); // mapeando os jogadores
        Game Game = new Game(playerCount);

        for (int i = 0; i < playerCount; i++) {
            players.add(new Player(i + 1, Game)); // adicionando os players no arraylist
        }

        // inicializando o jogo
        Game.setPlayers(players);
        Game.startGame();

    }

}

class Game {

    private AtomicInteger occupied; // quantidade de cadeiras ocupadas
    private int playerCount; // quantidade de jogadores
    private AtomicBoolean[] chairs; // booleano que diz se a cadeira tá ocupada ou não
    private ArrayList<Player> players; // arraylist dos jogadores

    public Game (int playerCount) {
        this.occupied = new AtomicInteger(0); // começando zerado
        this.playerCount = playerCount;
    }

    // instanciando os jogadores
    public void setPlayers(ArrayList<Player> players) {
        this.players = players;
    }

    // pegando o tamanho do array de booleanos 
    public int getLength() {
        return this.chairs.length;
    }
    // tem mais cadeiras vazias ou ocupadas?
    public boolean freeChairs() {
        return this.chairs.length > occupied.get();
    }


    public void reset(){
        this.occupied = new AtomicInteger(0);
        this.chairs = new AtomicBoolean[this.players.size() - 1];
        for (int i = 0; i < this.players.size() - 1; i++) {
            this.chairs[i] = new AtomicBoolean(false); // preenchendo o array de booleanos com falsos pra resetar a rodada
        }
    }

    public void startGame() {

        while (playerCount > 1) {
            reset(); // resetando o booleano das cadeiras para uma nova rodada

            Thread[] tplayers = new Thread[this.players.size()];
            for (int i = 0; i < this.players.size(); i++) {
                tplayers[i] = (new Thread(this.players.get(i)));
                tplayers[i].start();
            }

            try { // mandando todas as threads acabarem antes do processo principal
                for (int i = 0; i < playerCount; i++) {
                    tplayers[i].join();
                }
            } catch (InterruptedException e) {}

            for (int i = 0; i < this.players.size(); i++) {
                if (!this.players.get(i).getSeated()) { // jogador falhando em sentar
                    System.out.println("O jogador " + this.players.get(i).getId() + " foi eliminado!");
                    this.players.remove(i); // removendo o jogador eliminado 
                }
            }
            this.playerCount--; // diminuindo a quantidade de jogadores pós eliminação
            System.out.println("Fim da rodada!");
        }

        System.out.println("O jogador " + this.players.get(0).getId() + " foi o vencedor!"); // esse print só executa no final de todas as rodadas

        

    }

    public boolean seated(int seat, int idPlayer) { // função que seta os jogadores que conseguiram sentar ou os que falharam no processo
        
        if (!this.chairs[seat].getAndSet(true)) {
            this.occupied.getAndIncrement();
            System.out.println("O jogador " + idPlayer + " sentou na cadeira " + seat + "!");
            return true;
        } else {
            System.out.println("O jogador " + idPlayer + " falhou em sentar na cadeira " + seat + "!");
            return false;
        }
    }
}

// Classe jogadores
class Player implements Runnable {
    private int id;
    private Game Game;
    private boolean seated;

    public Player(int id, Game Game) {
        this.id = id;
        this.Game = Game;
        this.seated = false;
    }

    public int getId() {
        return this.id;
    }

    public boolean getSeated() {
        return this.seated;
    }

    public void run() {
        Random random = new Random(); // gerando um valor randomico para a cadeira
        this.seated = false;
        int chair;
        while (!this.seated && this.Game.freeChairs()) {
            chair = random.nextInt(this.Game.getLength());
            this.seated = this.Game.seated(chair, this.id);
        }
    }
}