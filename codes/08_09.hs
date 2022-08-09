type Nome = String

-- TIPOS ALGÉBRICOS (data) -- 

-- ENUMERAÇÃO --

data Temperatura = Fria | Quente -- sempre começando em caps
                    deriving(Eq, Show, Ord, Enum)

data Estacao = Verao | Outono | Inverno | Primavera
                    deriving(Eq, Show, Ord, Enum)

clima :: Estacao -> Temperatura
clima Verao     = Quente
{-clima Outono    = Quente
clima Inverno   = Fria
clima Primavera = Quente-}
-- ou...
clima   _       = Quente

-- PRODUTO CARTESIANO --

type Nome2 = String 
type Idade = Int

data Pessoas = Pessoa Nome2 Idade
                deriving(Show, Eq)

exibePessoa :: Pessoas -> String
exibePessoa (Pessoa str n) = str ++ " tem idade " ++ show n

type NomeProduto = String
type Preco       = Int

data Produtos = Produto NomeProduto Preco

type PessoasTupla   = (Nome2, Idade)
type ProdutosTupla  = (NomeProduto, Preco)

showPessoasTupla :: PessoasTupla -> String
showPessoasTupla (n, i) = n ++ " tem idade " ++ show i

{-

o construtor Pessoa em Pessoas e Produto em Produtos serve pra diferenciar tipos 
(não passar Pessoas usando parâmetros de Pessoa, por exemplo, já que ambos são String e Int)

-}

-- UNIÃO DISJUNTA --
-- alternativas: --

data Figura = Circulo Float
                | Retangulo Float Float
                    deriving(Show, Eq)

ehCircular :: Figura -> Bool
ehCircular (Circulo _) = True
ehCircular      _      = False

{-

ghci> ehCircular (Retangulo 2.0 7.8)
False
ghci> ehCircular (Circulo 2.0)
True

-}

areaFigura :: Figura -> Float
areaFigura (Circulo r)          = pi * r * r
areaFigura (Retangulo l1 l2)    = l1 * l2

{-

ghci> areaFigura (Retangulo 2.5 6.7)
16.75
ghci> areaFigura (Circulo 7)
153.93805

-}

data Ponto      = Ponto Float Float deriving (Show, Eq)
data figPlao    = Circ Ponto Float 
                    | Retang Ponto Ponto
                        deriving (Show, Eq)

--areaSuperficie :: Fig -> Float

{-

ghci> map (Circulo) [1..5]
[Circulo 1.0,Circulo 2.0,Circulo 3.0,Circulo 4.0,Circulo 5.0]
ghci> :t map (Circulo) [1..5]
map (Circulo) [1..5] :: [Figura]
ghci> :t map (Retangulo 10) [1..5]
map (Retangulo 10) [1..5] :: [Figura]
ghci> map (Retangulo 10) [1..5]
[Retangulo 10.0 1.0,Retangulo 10.0 2.0,Retangulo 10.0 3.0,Retangulo 10.0 4.0,Retangulo 10.0 5.0]

-}


-- TIPOS RECURSVIVOS -- 

{- data Expr = Lit Int
             | Add Expr Expr
             | Sub Expr Expr -} 

exp1 = Lit 1
exp2 = Add (Lit1) (Add (Lit 2) Lit (3))
exp3 = Sub (Add (Lit 6) (Lit 8)) (Add (Sub (Lit4) (Lit 2)) (Lit 1))

