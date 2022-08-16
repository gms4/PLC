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

data Ponto           = Ponto Float Float deriving (Show, Eq)
data FigPlano        = Circ Ponto Float
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

-- AULAS DE CASTOR --
-- raízes de uma equação --
-- ax2 + bx + c = 0.0
-- x = (-b +- sqrt(b2-4ac))/2a

oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
            where d = -b/(2.0*a)
                  e = sqrt(b*b - 4.0*a*c)/(2.0*a)

roots :: Float -> Float -> Float -> (Int, Float, Float)
roots a b c | b*b - 4.0*a*c < 0     = (0, 0, 0)
            | b*b - 4.0*a*c == 0    = (1, (oneRoot a b c), 0)
            | otherwise             = (2, raiz1, raiz2)
                where (raiz1, raiz2)= twoRoots a b c

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Guilherme", "A Danca dos Dragoes"), ("Larissa", "Os Sete Maridos de Evelyn Hugo"), ("Thais", "O Guia do Mochileiro das Galaxias")]

livros :: BancoDados -> Pessoa -> [Livro]
livros bd p = [l | (pp, l) <- bd, pp == p]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd l = [pp | (pp, ll) <- bd, ll == l]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = (emprestimos bd l) /= []

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length (livros bd p)

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar [] pessoa livro = [(pessoa, livro)]
emprestar ((p,l):as) pessoa livro
    | p == pessoa && l == livro      = (p, l):as
    | otherwise                      = (p, l): emprestar as pessoa livro

-- devolver :: BancoDados -> Pessoa -> Livro -> BancoDados