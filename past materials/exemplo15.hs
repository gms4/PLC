import System.IO.Unsafe
ehPrimo n aux 
	| (aux == 1) || (aux == 2) = True
	| mod n aux == 0 = False
	| otherwise  = ehPrimo n (aux -1)

main = do
	putStr("Digite o numero: ")
	y <- getLine
	let b = (ehPrimo (read y) ((read y)-1)) in
		print b
		
type Aluno = (String, Int, Int)
aluno1::Aluno
aluno1 = ("Bob", 18, 2008011234)

type Ponto = (Float, Float)
p1::Ponto 
p1 = (2,4)

-- distPontos :: Ponto -> Ponto -> Float

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

data Dia = Segunda | Terça | Quarta | Quinta | Sexta | Sábado | Domingo

data Forma = Circulo Float | Retangulo Float Float
area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a

