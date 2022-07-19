-- recursões primitivas

fib n
  | n == 0 = 0
  | n == 1 = 1
  | n > 1 = fib (n-1) + fib(n-2)

resto :: Integer -> Integer -> Integer

resto m n
  | m < n = m
  | otherwise = resto(m-n) n

--perdi mt coisa aqui no meio-- 

tailFat :: Int -> Int -> Int
tailFat 0 x = x
tailFat n x = tailFat (n-1)(n*x)

fat2 :: Int -> Int
fat2 x = tailFat x 1

{-

tailFat 3 1 
  = tailFat 2 3
  = tailFat 1 6
  = tailFat 0 6
  = 6

-}

minMax :: Int -> Int -> (Int, Int)
minMax x y 
  | x >= y     = (y, x)
  | otherwise  = (x, y)

addPair :: (Int, Int) -> Int
addPair (x, y) = x + y

addPair3 :: (Int, Int) -> Int
addPair3 p  = x + y
            where 
              x = fst p
              y = snd p

primeiroTripla :: (Int, Int, Int) -> Int
primeiroTripla (x, _, _) = x

fibStep :: (Integer, Integer) -> (Integer, Integer)
fibStep (u, v) = (v, u + v)

fibPair :: Integer -> (Integer, Integer)
fibPair n
  | n == 0    = (0, 1)
  | otherwise = fibStep ( fibPair (n-1))

fastFib :: Integer -> Integer
fastFib n = fst (fibPair n)