inc :: Int -> Int
inc x = x + 1

quadrado :: Int -> Int
quadrado x = x * x

inc1ValoresLista :: [Int] -> [Int]
inc1ValoresLista  []    = []
inc1ValoresLista (x:xs) = (inc x) : inc1ValoresLista xs
{-
inc1ValoresLista [1,2]
= (inc 1) : inc1ValoresLista [2]
= (inc 1) : (inc 2) : inc1ValoresLista []
= (inc 1) : (inc 2) : []
= 2 : 3 : []
= [2,3]
-}
quadValoresLista :: [Int] -> [Int]
quadValoresLista  []    = []
quadValoresLista (x:xs) = (quadrado x) : quadValoresLista xs

mapIntLista :: (Int -> Int) -> [Int] -> [Int]
mapIntLista f []     = []
mapIntLista f (x:xs) = f x : mapIntLista f xs

map1 :: (t -> t) -> [t] -> [t]
map1 f []     = []
map1 f (x:xs) = f x : map1 f xs

map2 :: (t -> u) -> [t] -> [u]
map2 f []     = []
map2 f (x:xs) = f x : map2 f xs

-- map2 eh map da biblioteca

ehPar :: Int -> Bool
ehPar x =  mod x 2 == 0

map3 :: (t -> u) -> [t] -> [u]
map3 f l = [f x  | x <- l ]

{-
*Main Data.Char> :t (+1)
(+1) :: Num a => a -> a
*Main Data.Char> map (+1) [1..5]
[2,3,4,5,6]
*Main Data.Char> map (map (+1)) [[1,2,3],[7,8,9]]
[[2,3,4],[8,9,10]]
*Main Data.Char> :t map (+1)
map (+1) :: Num b => [b] -> [b]

map (map (+1)) [[1,2,3],[7,8,9]]
= map (+1)  [1,2,3] : map (map (+1)) [[7,8,9]]
= map (+1)  [1,2,3] : map (+1) [[7,8,9]] : map (map (+1)) []
= map (+1)  [1,2,3] : map (+1) [[7,8,9]] : []
= [2,3,4] : [8,9,10] :[]
= [[2,3,4],[8,9,10]] 
-}

filtroPares :: [Int] -> [Int]
filtroPares []  = []
filtroPares (x:xs)
 | ehPar x    = x :  filtroPares xs
 | otherwise  = filtroPares xs

div7 :: Int -> Bool
div7 x = mod x 7 == 0

filtroDiv7 :: [Int]  -> [Int]
filtroDiv7  []     = []
filtroDiv7 (x:xs)
  | div7 x         = x : filtroDiv7 xs
  | otherwise      = filtroDiv7 xs

filtroListaInt :: (Int -> Bool) -> [Int] -> [Int]
filtroListaInt f [] = []
filtroListaInt f (x:xs)
  | f x        = x : filtroListaInt f xs
  | otherwise  = filtroListaInt f xs

filtroLista :: (t -> Bool) -> [t] -> [t]
filtroLista f []   = []
filtroLista f (x:xs)
 | f x         = x : filtroLista f xs
 | otherwise   =  filtroLista f xs

-- filtroLista eh a funcao filter da biblioteca

ehDigito :: Char -> Bool
ehDigito ch = ch >= '0' && ch <= '9'

filtoDefCompLista ::  (t -> Bool) -> [t] -> [t]
filtroDefCompLista f l =  [ x |  x <- l, f x  ]

{-
*Main Data.Char> map fst [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')]
[1,2,3,4]
*Main Data.Char> :t map fst 
map fst :: [(b1, b2)] -> [b1]
*Main Data.Char> :t map fst [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')]
map fst [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')] :: Num b => [b]
*Main Data.Char> :t map snd [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')]
map snd [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')] :: [Char]
*Main Data.Char> map snd [(1, 'a'),(2, 'b'),(3, 'c'),(4, 'd')]
"abcd"
*Main Data.Char> :t (>)
(>) :: Ord a => a -> a -> Bool
*Main Data.Char> :t (>5) 
(>5) :: (Ord a, Num a) => a -> Bool
*Main Data.Char> (>5) 7
True
*Main Data.Char> (>5) 10
True
*Main Data.Char> (>5) 4
False
*Main Data.Char> map (>5) [1..10]
[False,False,False,False,False,True,True,True,True,True]
-}

-- Folding

somaLista :: [Int]  -> Int
somaLista []     = 0
somaLista (x:xs) = (+) x (somaLista xs)

produtoLista :: [Int] -> Int
produtoLista []      = 1 
produtoLista (x:xs)  = (*) x  (produtoLista xs)

andLista :: [Bool] -> Bool
andLista []     =  True
andLista (x:xs) =  (&&) x (andLista xs)

{-
fld f v []     = v
fld f v (x:xs) = f x (fld f v xs)
-}