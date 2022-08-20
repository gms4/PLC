busca :: [Int] -> Int -> Bool
busca [] v = False
busca (h:t)	v 
 | h == v = True
 | h /= v = busca t v
