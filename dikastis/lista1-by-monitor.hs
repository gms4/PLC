----- POTENCIA A -----
potencia :: Int -> Int -> Int
potencia n 0 = 1
potencia n k = n * potencia n (k-1)

----- QUANTAS DIVISÕES EXATAS -----
numDiv :: Integral a => a -> a -> a
numDiv dividendo 0 = 0
numDiv dividendo divisor
    | (divisor > dividendo)             = 0
    | (mod dividendo divisor) == 0      = 1 + numDiv (div dividendo divisor) divisor
    | otherwise                         = 0

----- QUAIS OS ÚNICOS -----
elementosDuplicados :: [Int] -> [Int]
elementosDuplicados [] = []
elementosDuplicados (x:xs)
    | ocorrencia x xs = x : elementosDuplicados xs
    | otherwise = elementosDuplicados xs

ocorrencia :: Int -> [Int] -> Bool
ocorrencia n [] = False
ocorrencia n (x:xs)
    | x == n        = True
    | otherwise     = ocorrencia n xs

removerElemento :: Int -> [Int] -> [Int]
removerElemento _ [] = []
removerElemento n (x:xs)
    | n == x        = removerElemento n xs
    | otherwise     = x : removerElemento n xs

removerElementos :: [Int] -> [Int] -> [Int]
removerElementos [] [] = []
removerElementos (x:xs) [] = []
removerElementos [] (x:xs) = (x:xs)
removerElementos (x:xs) (y:ys) = removerElementos xs (removerElemento x (y:ys))

unicos :: [Int] -> [Int]
unicos [] = []
unicos list = removerElementos (elementosDuplicados list) list 

----- REMOVA E DIVIDA -----
remDiv :: Int -> [a] -> ([a], [a])
remDiv _ [] = ([], [])
remDiv i list = (take (i-1) list, drop i list)

----- JUNTAR AS LISTAS -----
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge list [] = list
merge [] list = list
merge (x:xs) (y:ys) 
    | x <= y            = [x] ++ merge xs (y:ys)
    | otherwise         = [y] ++ merge (x:xs) ys

----- DIVIDA AS LISTAS -----
metade :: [a] -> ([a], [a])
metade [] = ([], [])
metade lista = (takeAllPar lista 0, takeAllImpar lista 0)

takeAllPar :: [a] -> Int -> [a]
takeAllPar [] _ = []
takeAllPar (x:xs) i
    | mod i 2 == 0      = [x] ++ takeAllPar xs (i+1)
    | otherwise         = takeAllPar xs (i+1)

takeAllImpar :: [a] -> Int -> [a]
takeAllImpar [] _ = []
takeAllImpar (x:xs) i
    | mod i 2 == 1      = [x] ++ takeAllImpar xs (i+1)
    | otherwise         = takeAllImpar xs (i+1)

----- SORT & MERGE -----
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort lista = let (metade1, metade2) = metade lista
                in merge (msort metade1) (msort metade2)