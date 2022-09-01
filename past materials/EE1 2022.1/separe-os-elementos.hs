-- belinha -- 
divide :: (Int->Bool) -> [Int] -> ([Int],[Int])
divide f a = ([x | x <- a, f x == False], [y | y <- a, f y == True])