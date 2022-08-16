import Data.List

-- Classes em Haskell --

elemBool :: Bool -> [Bool] -> Bool
elemBool b []   = False
elemBool b (x:xs)       
    | b == x    = True
    | otherwise = elemBool b xs

elemInt :: Int -> [Int] -> Bool
elemInt n []    = False
elemInt n (x:xs)
    | n == x        = True
    | otherwise     = elemInt n xs

elemGen :: (a -> a -> Bool) -> a -> [a] -> Bool
elemGen f x []      = False
elemGen f x (y:ys)
    | f x y         = True
    | otherwise     = elemGen f x ys

{-
*Main> elemInt 3 [1..6]
True
*Main> elemGen (==) 3 [1..6]
True
-}

elemGen' :: (Eq a) => a -> [a] -> Bool --o tipo a tem que ter uma função de igualdade implementada pra ele
elemGen' x []       = False
elemGen' x (y:ys)
    | x == y         = True
    | otherwise     = elemGen' x ys

{-
*Main> elemGen' 3 [1..4]
True
*Main> elemGen' 5 [1..4]
False
-}

data Dias = Dom | Seg | Ter | Qua | Qui | Sex | Sab
            deriving (Show, Eq, Ord, Enum)

{-
*Main> [Dom .. Qui]
[Dom,Seg,Ter,Qua,Qui]
*Main> Dom < Qui
True
-}

data Lista t = Nil | Cons t (Lista t)
            deriving (Show, Eq, Ord)

class Visible t where
        toString :: t -> String
        size     :: t -> Int

instance Visible Char where
        toString ch = [ch] 
        size ch     = 1

{-
*Main> toString 'a'
"a"
*Main> size 'a'
1
-}

instance Visible Bool where
        toString True   = "True"
        toString False  = "False"
        size _          = 1

{-
*Main> toString True
"True"
*Main> toString False
"False"
*Main> size True
1
*Main> size False
1
-}

instance Visible Int where
        toString n      = show n
        size _          = 1

{-
*Main> toString (2::Int)
"2"
*Main> size (2::Int)
1
-}

{-
*Main> map toString [1::Int, 2::Int, 3::Int]
["1","2","3"]
*Main> [ toString x | x <- [1::Int, 2::Int, 3::Int]]
["1","2","3"]
*Main> concat ["1", "2", "3"]
"123"
-}

instance Visible t => Visible [t] where
        toString = concat . ( map toString ) -- concat vai fazer o resultado ficar "123"
        size     = ( foldr (+) 0 ) . (map size) -- foldr soma as coisas, mas como foi foldr (+) 0 só vai somar os itens da lista

{-
*Main> toString [1::Int, 2::Int, 3::Int]
"123"
*Main> toString ['a','b', 'c']
"abc"
*Main> size ["1", "2", "3"]
3
-}

vSort :: (Ord t, Visible t) => [t] -> String
vSort = toString . sort 

{-
*Main> :m + Data.List
*Main Data.List> :t sort
sort :: Ord a => [a] -> [a]
*Main Data.List> sort [4, 5, 3, 2, 1, 6, 7]
[1,2,3,4,5,6,7]
*Main Data.List> sort ['z', 'b', 'h', 'r', 'f', 't']
"bfhrtz"
*Main Data.List> vSort [10::Int, 4::Int, 7::Int, 3::Int]
"34710"
-}

instance (Visible t, Visible u) => Visible (t, u) where
        toString (x, y) = toString x ++ toString y
        size (x, y) = size x + size y

{-
*Main Data.List> :toString (1::Int, 3::Int)
"13"
*Main Data.List> size (1::Int, 3::Int)
2
-}