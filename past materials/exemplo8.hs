lista2 :: [Int] -> [Int]
lista2 [] = []
lista2 l = [ 2 * h | h <- l]
