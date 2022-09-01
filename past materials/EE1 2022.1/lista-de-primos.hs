-- belinha --
ehDivisor :: Int -> [Int] -> Bool
ehDivisor 0 _ = False
ehDivisor x [] = False
ehDivisor x (y:ys) = if mod y x == 0 then True else ehDivisor x ys

primos :: [Int] -> [Int]
primos [] = []
primos (x:xs) = if ehDivisor x xs then primos xs else x : primos xs

primosN :: Int -> [Int]
primosN n
    | n > 0 = primos [1..n]
    | otherwise = []