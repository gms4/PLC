-- Composicao de funcoes

inc :: Int -> Int
inc x = x + 1

aplicaDuasVezes :: (t -> t) -> t -> t
aplicaDuasVezes f v = f (f v)

aplicaDuasVezes2 :: (t -> t) -> t -> t
aplicaDuasVezes2 f v = (f . f) v

maiorQue7 :: Int -> Bool
maiorQue7 x = x > 7

{-
*Main> :t not
not :: Bool -> Bool
*Main> :r
[1 of 1] Compiling Main             ( 08_04.hs, interpreted )
Ok, one module loaded.
*Main> maiorQue7 4
False
*Main> not (maiorQue7 4)
True
*Main> (not . maiorQue7) 4
True
*Main>
-}

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f)  . f

{-
iter 3 g
= (iter 2 g) . g
= ((iter 1 g) . g) . g
= ((iter 0 g) . g) . g) . g
= ((id . g) . g) . g

iter 3 not
= ((id . not) . not) . not

iter 4 not
= ((id . not) . not) . not ) . not

-}

mzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
mzipWith f (x:xs) (y:ys) = (f x y)  : mzipWith f xs ys
mzipWith f   _      _    = [] 

{-
mzipWith ($) [sum, product] [[1..6],[5,6,7,9]]
= (($) sum [1..6])  : mzipWith ($) [product] [[5,6,7,9]]
= (($) sum [1..6])  : (($) product [5,6,7,9]) : mzipWith ($) [] []
= (($) sum [1..6])  : (($) product [5,6,7,9]) : []
= 21 : 1890 : []
= [21, 1890]
-}

-- Notacao lambda

{-
*Main> map (\x -> x + 1) [1..6]
[2,3,4,5,6,7]
*Main> filter (\x -> mod x 2 == 0) [1..10]
[2,4,6,8,10]

*Main> ((filter (\x -> mod x 2 == 0)) . (map (\x -> x + 1))  ) [1..20]
[2,4,6,8,10,12,14,16,18,20]
-}

addNum :: Int -> (Int -> Int)
addNum x = h
  where h y = x + y 

addNumLambda :: Int -> (Int -> Int)
addNumLambda x = (\y -> y + x)

{-
*Main> let fLista x = map (\f -> f x) [(\x -> x +1), (\y -> y * 2)] 
*Main> fLista 5
[6,10]

*Main> let comp2 f g = (\ x y -> g (f x) (f y))
*Main> let comp2Apl = comp2 inc (+)
*Main> :t comp2Apl 
comp2Apl :: Int -> Int -> Int
*Main> comp2Apl 2 3
7
*Main> (\ x y -> (+) (inc x) (inc y) ) 2 3
7
-}


-- Aplicacao parcial de funcoes

add3Int :: Int -> Int -> Int -> Int
add3Int x y z = x + y + z

{-
*Main> :t iter
iter :: Int -> (t -> t) -> t -> t
*Main> let iterParcial = iter 5
*Main> :t iterParcial 
iterParcial :: (t -> t) -> t -> t
*Main> let iterParcialApp = iterParcial inc
*Main> :t iterParcialApp
iterParcialApp :: Int -> Int
*Main> iterParcialApp 5
10
*Main> iterParcialApp 10
15
-}


{-
iter 4 (/2)
= (iter 3 (/2)) . (/2)
= ((iter 2 (\2)).(\2)) . (\2)
= (( (iter 1 (\2)) . (\2) ).(\2)) . (\2)
= (( ((iter 0 (\2)) . (\2)). (\2) ).(\2)) . (\2)
= (( (id . (\2)). (\2) ).(\2)) . (\2)

iter 4 ((/) 2)
= (iter 3 ((/) 2)) . ((/) 2)
= ((iter 2 ((/) 2)).((/) 2) . ((/) 2)
= (( (iter 1 ((/) 2)) . ((/) 2) ).((/) 2)) . ((/) 2)
= (( ((iter 0 (((/) 2))) . ((/) 2)). ((/) 2) ).((/) 2)) . ((/) 2)
= (( (id . (((/) 2))). (((/) 2)) ).(((/) 2))) . (((/) 2))


-}