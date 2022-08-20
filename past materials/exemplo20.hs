import System.IO.Unsafe 
zip1::[t] -> [t] -> [(t,t)]
zip1 [] l2 = []
zip1 l1 [] =[]
zip1 (h1:t1) (h2:t2) = (h1,h2):(zip1 t1 t2)

par x = (mod x 2) == 0
par1 x = 
	if (x == 0) then 
		True 
	else not (par1 (x-1))

test n = 
	if (n `mod` 2 == 0) then n
	else test(2 * n + 1)

-- 	
eq1 :: Float -> Float -> Float
eq1 a b = b/a

fibonacci :: Int -> Int
fibonacci n
	| (n == 0) = 0
	| (n == 1) = 1
	| (n /= 0) && (n /= 1) = (fibonacci (n-2) + fibonacci(n-1))

bissexto:: Int-> Bool
bissexto x | (mod x 400 == 0) = True
	| (mod x 4 == 0) && (mod x 100 /= 0) = True
	| otherwise = False

type Data = (Int,Int,Int)
valida::Data->Bool
valida (d,m,a)
	| d >= 1 && d <= 31 &&
	(m == 1||m == 3||m == 5||m == 7||m == 8||m == 10||m == 12) = True
	| d >= 1 && d <= 30 && (m == 4||m == 6||m == 9||m == 11) = True
	| d >= 1 && d <= 28 && m == 2 && not (bissexto a) = True
	| d >= 1 && d <= 29 && m == 2 && (bissexto a) = True
	| otherwise = False

divIntervalo :: Int->(Int, Int)->[Int]	
divIntervalo n (a,b)
	| a > n = []
	|(a==b)&&(mod n a==0) = [a] 
	|(a/=b)&&(mod n a==0) = a:(divIntervalo n ((a+1),b))
	|otherwise = (divIntervalo n (a+1,b))

pegaDiv :: Int->[Int]->[Int]		
pegaDiv n lista = [a | a<-lista, mod n a==0]	

-- tamanho::[t] -> Int -> [Int]
tamanho l  
	| l == [] = 0
	| otherwise = (1 + tamanho (tail l))

insert::t -> Int -> [t] -> [t]	
insert n p l 
		| p == 1 = n:l
		| p /= 1 = (head l):(insert n (p-1) (tail l))
		
remove:: Int -> [t] -> [t]	
remove p l 
		| p == 1 = tail l
		| p /= 1 = (head l):(remove (p-1) (tail l))

type Aluno = (String, Int,Int)
cadastro :: String -> Int -> Int -> [Aluno]
cadastro nome nac ano = [(nome,nac,ano)]

listaCadastro n = 
	if (n==0) then
		return []
	else
		do
			putStr("Digite o nome: \n")
			x <- getLine
			putStr("Digite a data de nascimento: \n")
			y <- getLine
			putStr("Digite o ano: \n")
			z <- getLine
			let aux = (unsafePerformIO(listaCadastro (n-1))) in
				if (aux/=[]) then
					return ((cadastro x (read y) (read z))++aux)
				else return ((cadastro x (read y) (read z))++aux)
-- main = do
imprimeCadastro:: [Aluno] -> IO()
imprimeCadastro [] = putStr("")	
imprimeCadastro ((n,i,a):t) = 
		do
			putStr("- Nome: "++n++" - ")
			putStr("Idade: "++(show i)++" - ")
			putStr("Semestre: "++(show a)++"\n")
			imprimeCadastro t
	
	