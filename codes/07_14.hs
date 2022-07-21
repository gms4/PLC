fib :: Int -> Int
fib n
 | n == 0 = 0
 | n == 1 = 1
 | n > 1 = fib (n-1) + fib(n-2)



totalVendasGuardas :: Int -> Int
totalVendasGuardas n
  | n ==  0  = vendas 0
  | n >   0  = vendas n + totalVendasGuardas (n-1)


totalVendasCasPad :: Int -> Int
totalVendasCasPad 0 = vendas 0
totalVendasCasPad n = vendas n + totalVendasCasPad (n-1)


maxi :: Int -> Int -> Int
maxi x y
  | x >= y    = x
  | otherwise = y

vendas :: Int -> Int
vendas 0 = 32
vendas 1 = 12
vendas 2 = 56
vendas 3 = 34


maxVendas :: Int -> Int
maxVendas n
  | n == 0 = vendas 0                          --maxVendas.0
  | n > 0  = maxi (vendas n) (maxVendas (n-1)) --maxVendas.1 

{-
maxVendas 2
= maxi (vendas 2) (maxVendas 1)  [maxVendas.1]
= maxi (vendas 2) (maxi (vendas 1) (maxVendas 0))  [maxVendas.1]
= maxi (vendas 2) (maxi (vendas 1) (vendas 0))  [maxVendas.0]
= maxi (vendas 2) (maxi 12 32) 
= maxi (vendas 2) (maxi 12 32) 
= maxi (vendas 2) 32
= maxi 56 32
= 56
-}


fat :: Int -> Int
fat 0 = 1
fat n = n * fat (n-1)

{-
fat 3
= 3 * (fat 2)
= 3 * (2 * fat 1 )  
= 3 * (2 * (1 * fat 0) )  
= 3 * (2 * (1 * 1) )  
= 6
-}

tailFat :: Int -> Int -> Int
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)

fat2 :: Int -> Int
fat2 x = tailFat x 1

{-
tailFat 3 1
= tailFat 2 3
= tailFat 1 6
= tailFat 0 6
= 6
-}

intP :: (Int, Int)
intP = (1,2)


{-
*Main> :t ()
() :: ()
*Main> :t (2)
(2) :: Num p => p
*Main> :t (2,2)
(2,2) :: (Num a, Num b) => (a, b)
*Main> :t (2,'a')
(2,'a') :: Num a => (a, Char)
*Main> :t (2,'a', True)
(2,'a', True) :: Num a => (a, Char, Bool)
-}

minMax :: Int -> Int -> (Int, Int)
minMax x y
 | x >= y    = (y, x)
 | otherwise = (x, y)

addPair :: (Int, Int) -> Int
addPair (x, y)  = x + y

addPair2 :: (Int, Int) -> Int
addPair2 (0, y)  = y
addPair2 (x, y)  = x + y

addPair3 :: (Int, Int) -> Int
addPair3 p  = x + y
         where 
             x = fst p
             y = snd p 

addPair4 :: (Int, Int) -> Int
addPair4 p  = fst p + snd p


primeiroTripla :: (Int, Int, Int) -> Int
primeiroTripla (x, _, _) = x

-- fibPair n = (fib n, fib(n+1))

fibStep  :: (Integer, Integer) -> (Integer, Integer)
fibStep (u, v)  = (v, u+v)

fibPair :: Integer -> (Integer, Integer)
fibPair n
 | n == 0     = (0, 1)
 | otherwise  = fibStep( fibPair (n-1))

fastFib :: Integer -> Integer
fastFib n = fst (fibPair n)