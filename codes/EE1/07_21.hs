tamListaInt :: [Int] -> Int
tamListaInt []     = 0                 -- caso base
tamListaInt (x:xs) = 1 + tamListaInt xs   -- caso recursivo


tamListaBool :: [Bool] -> Int
tamListaBool []     = 0                 -- caso base
tamListaBool (x:xs) = 1 + tamListaBool xs   -- caso recursivo

tamLista :: [a] -> Int
tamLista []      = 0                 --tamLista.1
tamLista (x:xs)  = 1 + tamLista xs   --tamLista.2

mhead :: [a] -> a
mhead []      = error "Lista vazia"
-- mhead (x:xs) = x
mhead (x:_)  = x

mtail :: [a] -> [a]
mtail []     = error "Lista vazia"
--mtail (x:xs) = xs
mtail (_:xs) = xs

mtake :: Int -> [a] -> [a]
mtake 0 _      = []                  --mtake.1
mtake n []     = []                  --mtake.2
mtake n (x:xs) = x : mtake (n-1) xs  --mtake.3

{-
mtake 2 [1,2,3]
= mtake 2 (1:[2,3])     [definicao de :]
= 1 : mtake 1 [2,3]     [mtake.3]
= 1 : mtake 1 (2:[3])   [definicao de :]
= 1 : 2 : mtake 0 [3]   [mtake.3]
= 1 : 2 : []            [mtake.1]
= 1 : [2]               [definicao de :]
= [1,2]                 [definicao de :]
-}

mdrop :: Int -> [a] -> [a]
mdrop 0 l      =  l
mdrop _ []     = []
mdrop n (x:xs) = mdrop (n-1) xs


-- insertion sort

iSort :: [Int] -> [Int]
iSort []      = []
iSort (x:xs)  = ins x (iSort xs)

ins :: Int -> [Int] -> [Int]
ins x []       = [x]
ins x (y:ys)  
  | x <= y     = (x:y:ys)
  | otherwise  = y: ins x ys


somaLista :: [Int] -> Int
somaLista []      = 0
somaLista (x:xs)  = x + somaLista xs 

{-
somaLista [1,2,3] 
= somaLista (1:[2,3])
= 1 + somaLista [2,3]
= 1 + 2 + somaLista [3]
= 1 + 2 + 3 + somaLista []
= 1 + 2 + 3 + 0
-}