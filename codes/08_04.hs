import Data.Bitraversable (Bitraversable)
import Data.Void (vacuous)
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
somaLista [1,2,3]
= (+) 1 (somaLista [2,3])
= (+) 1 ((+) 2 (somaLista [3]) ) 
= (+) 1 ((+) 2 ((+) 3 (somaLista [])) ) 
= (+) 1 ((+) 2 ((+) 3 0) ) 
= (+) 1 ((+) 2 3 ) 
= (+) 1 5 
= 6
-}


{-
fld :: (t -> t -> t ) -> t -> [t] -> t
fld f v []     = v
fld f v (x:xs) = f x (fld f v xs)
-}

mfoldr :: (a -> b -> b) -> b -> [a] -> b
mfoldr f v []      = v
mfoldr f v (x:xs)  = f x (mfoldr f v xs)

{-
mfoldr (+) 0 [1,2,3]
= (+) 1 (mfoldr (+) 0 [2,3])
= (+) 1 ((+) 2 (mfoldr (+) 0 [3]))
= (+) 1 ((+) 2 ((+) 3 (mfoldr (+) 0 [])))
= (+) 1 ((+) 2 ((+) 3 0))
= (+) 1 ((+) 2 3))
= (+) 1 5
= 6
-}

-- 'mfoldr' eh 'foldr' na biblioteca

{-
mfoldr (/) 1 [1,2.0,3]
= (/) 1 (mfoldr (/) 1 [2.0, 3]) 
= (/) 1 ((/) 2.0 ( mfoldr (/) 1 [3])) 
= (/) 1 ((/) 2.0 ((/) 3 (mfoldr (/) 1 []))) 
= (/) 1 ((/) 2.0 ((/) 3 1)) 
= (/) 1 ((/) 2.0 3.0) 
= (/) 1 0.6 
= 1.5151515151515151
-}


mfoldr1 :: (a -> a -> a) ->  [a] -> a
mfoldr1 f [v]    = v
mfoldr1 f (x:xs) = f x (mfoldr1 f xs)

-- 'mfoldr1' eh 'foldr1' na biblioteca

mfoldl :: (b -> a -> b) -> b -> [a] -> b
mfoldl f v []      = v
mfoldl f v (x:xs)  = mfoldl f (f v x) xs

{-
mfoldl (+) 0 [1..3]
= mfoldl (+) ((+) 0 1) [2,3]
= mfoldl (+) 1 [2,3]
= mfoldl (+) ((+) 1 2 ) [3]
= mfoldl (+) 3 [3]
= mfoldl (+) ((+) 3 3) []
= mfoldl (+) 6 []
= 6
-}

mOr :: [Bool] -> Bool
mOr l = mfoldl (||) False l

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

{-
*Main> filter ehPar [1..10]
[2,4,6,8,10]
*Main> foldl (+) 0 (filter ehPar [1..10])
30
*Main> foldl (+) 0 (map (+1)  (filter ehPar [1..10]))
35
*Main> foldl (+) 0 ((filter ehPar (map (+1) [1..10])))
30
-}

paraUm :: t -> Int
paraUm x = 1

comprimentoLista :: [t] -> Int
comprimentoLista l  = mfoldr (+) 0 (map paraUm l)

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