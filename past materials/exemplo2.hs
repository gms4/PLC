-------------------------------
--------- ehPar.hs ------------
-------------------------------
import System.IO.Unsafe 
import IO
import Hugs.Array
div2 :: Int -> Bool
div2 x =
	ehPar x
div4 n
 | mod n 4 == 0 = True
 | otherwise = False
 
ehPar :: Int -> Bool
ehPar x =
	if ( mod x 2 == 0 ) then
		True
	else False
	
ehImpar n = (not (ehPar n))

media :: Float -> Float -> Float -> Float 
media a b c =
	((soma a b c)/3)
	where
		soma a b c = (a + b + c)

data Arvore = Null | Node Int Arvore Arvore

procuraValor :: Arvore -> Int ->Bool
procuraValor Null num = False
procuraValor (Node valor esq dir) num
	| valor == num = True
	| otherwise = False || (procuraValor esq num) ||
	(procuraValor dir num)

pegaValor func inic valor = take valor (iterate func inic)

pares :: [t] -> [u] -> [(t,u)]
pares n m = [(a,b) | a <- n , b <-m]

igual Null Null = True
igual (Node x esq dir) (Node y esq1 dir1) 
	| x == y = igual (esq) (esq1) && igual (dir) (dir1)
	| otherwise = False
igual _ _ = False

headList (h:t) = h
tailList (h:t) = t

numToString :: Int -> String
numToString x =
  case x of
  0 -> "zero"
  1 -> "um"
  2 -> "dois"
  3 -> "três"
  4 -> "quatro"
  5 -> "cinco"
  otherwise -> ""

ehParPrint :: Int -> Bool
ehParPrint n =
	if (mod n 2 == 0) then
		let x = (unsafePerformIO(putStr(show n))) in
			if (x == ()) then
				True
			else
				True
	else
		False

rInt :: String -> Int
rInt = read

rBool :: String -> Bool
rBool = read

rFloat :: String -> Float
rFloat = read

rString :: Int -> String
rString = show

getNumber = do
	putStr("Digite o numero: ")
	y <- getLine
	putStr("O numero digitado foi " ++y++"\n")

getChar1 = do
	putStr("Digite um caractere: ")
	y <- getChar
	putStr("\n"++"O caracter digitado foi " ++show y++"\n")

formaString :: String -> Int -> String
formaString x n = 
	let y = (unsafePerformIO(getChar)) in
	let x1 = (x ++ show(y)) in
		let n1 = (n-1) in
			if (n == 0) then x1
			else (formaString x1 n1)

-- main = do
	-- putStr ("Escreva uma linha e tecle ENTER: ")
	-- linha <- getLine
	-- nome <- criaArq linha
	-- putStr ("A linha \n" ++ linha ++ "\nesta no arquivo " ++ nome ++ "!")
criaArq :: String -> IO String
criaArq linha = do
	putStr ("Nome do Arquivo a ser criado: ")
	nome <- getLine
	writeFile nome linha
	return (nome)		
	
-- main = do
	-- putStr("Escreva o nome do arquivo: ")
	-- x <- getLine
	-- y <- getStringArq x
	-- putStr(y)
	
getStringArq :: String -> IO String 	
getStringArq nome = do
	x <- readFile nome
	return x

-- main = do
	-- nomes <- leNomes
	-- putStr (nomes)

leNomes = do
	putStr ("Escreva um nome: ")
	nome <- getLine
	if nome == ""
		then return []
		else do
			nomes <- leNomes
			return (nome ++"\n"++ nomes)
			