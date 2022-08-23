----- ORIENTAÇÃO A OBJETO -----

{-

Objeto é um agrupamento dos dados e operações que representam um conceito
- Conta bancária tem número, saldo e as ações creditar e debitar;
- Aluno da UFPE no sig@ tem nome, cpf, endereço e ações corrigir nome, atualizar endereço;

Eles possuem blocos básicos para construção de um programa, e contém dados que podem ser usados ou modificados;
- Identidade (id único) -> Identidade ("1")
- Estado (valores armazenados) -> (cor, tipo de pneu, etc);
- Interface (volante, pedal do freio, etc);
- Comportamento (operações que uma conta pode executar).

Comportamento muda estado
    Número da conta: "123-x", saldo 354,78
    -> COMPORTAMENTO CREDITAR (20)
    Número da conta: "123-x", saldo 374,78

Classes são agrupamentos de objetos (ou denota um conjunto de objetos)
- Possuem propriedades comuns e realizam as mesmas operações;
- Descreve a estrutura dos objetos da classe internamente (propriedades e operaçÕes);
- Classe é um conceito, objeto é uma instância desse conceito;
- Uma classe pode ter múltiplos objetos
- "Classe é forma, objeto é bolo"

Classe x Objeto
- Múltiplos objetos sao criados a partir da mesma classe

Como declarar uma classe em Java?

public class Conta {
    CorpoDaClasse
}

corpo pode possuir atributos, métodos, construtores, outras classes, etc

Conta() {
    saldo = 0;
    ...
}

-> Quando não se declara construtor, o construtor implícito com valores default é acionado

public class Conta {
    ...
    public class Conta(String numeroInicial, double saldoInicial) {
        numero - numeroInicial;
        saldo = saldoInicial;
    }
}

Criando objeto...

Conta c;
c = new Conta ("12345", 100.0);

Public class Conta {
    private String numero;
    private double saldo;
    public Conta (String numeroInicial) {
        numero = numeroInicial;
        saldo = 0.0;
    }
    --tinha mais coisa aqui mas eu perdi--
}

-- HERANÇA --
-- desisto --


-}
