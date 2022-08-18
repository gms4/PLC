import GHC.RTS.Flags (GCFlags(largeAllocLim))
import GHC.Base (absentErr)

rev :: [t]  -> [t]
rev []       = []
rev (x: xs)  =  rev xs ++ [x] 

{-
rev [1,2,3]
= rev [2,3] ++ [1]
= rev [3] ++ [2] ++ [1]
= rev [] ++ [3] ++ [2] ++ [1]
= [] ++ [3] ++ [2] ++ [1]
= [3,2,1]
-}

-- concatenacao de listas

(+++) :: [t] -> [t] -> [t]
(+++) [] l      = l
(+++) (x:xs) l  = x : (xs +++ l)

{-
(+++) [1,2] [3,4]
= 1 : ((+++) [2] [3,4] )
= 1 : (2 : ((+++)[] [3,4]  ))
= 1 : 2 : [3,4]
= [1,2,3,4]
-}

-- expressao "case ... of ..."
{-
case <expressao> of
    casPadrao1 -> <exp1>
    casPadrao2 -> <exp2>
-}


exExpCase1 :: String
exExpCase1 = case True of
               True   -> "verdadeiro"
               False  -> "falso" 

exExpCase2 :: Bool -> String
exExpCase2 b = "Funcao exExpCase2" ++
               case b of
                   True -> " verdadeiro"
                   False -> " falso" 
                ++ " eh o resultado"

headCaseOf1 :: [a] -> a
headCaseOf1 l =
    case l of
        []     -> error "lista vazia"
        (x:xs) -> head l

headCaseOf2 :: (Show a) => [a] -> String
headCaseOf2 l = "Uma lista" ++ 
    case l of
        []     -> "  vazia"
        (x:_) -> " com valor " ++ show x ++  " na cabeca da lista "

mzip :: [a] -> [b] -> [(a,b)]
mzip (x:xs) (y:ys) =  (x,y)  : mzip xs ys
mzip []  (y:ys)    = []
mzip (x:xs) []     = []
mzip [] []         = []

mzip2 :: [a] -> [b] -> [(a,b)]
mzip2 (x:xs) (y:ys) =  (x,y)  : mzip2 xs ys
mzip2 []  _         = []
mzip2 _ []           = []

mzip3 :: [a] -> [b] -> [(a,b)]
mzip3 (x:xs) (y:ys) =  (x,y)  : mzip3 xs ys
mzip3 _ _         = []


-- Funcoes de alta ordem

inc :: Int -> Int
inc x = x + 1

quadrado :: Int -> Int
quadrado x = x * x

aplicaDuasVezes :: (Int -> Int) -> Int -> Int
aplicaDuasVezes f x = f (f x)

total :: (Int -> Int) -> Int -> Int
total f 0 = f 0
total f n = f n + total f (n-1)

vendas 0 = 12
vendas 1 = 23
vendas 2 = 34

inc1ValoresLista :: [Int] -> [Int]
inc1ValoresLista  []    = []
inc1ValoresLista (x:xs) = (inc x) : inc1ValoresLista xs

quadValoresLista :: [Int] -> [Int]
quadValoresLista  []    = []
quadValoresLista (x:xs) = (quadrado x) : quadValoresLista xs

mapIntLista :: (Int -> Int) -> [Int] -> [Int]
mapIntLista f []     = []
mapIntLista f (x:xs) = f x : mapIntLista f xs