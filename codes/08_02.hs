inc :: Int -> Int
inc x = x + 1

quadrado :: Int -> Int
quadrado x = x * x

inc1ValoresLista :: [Int] -> [Int]
inc1ValoresLista [] = []
inc1ValoresLista (x:xs) = (inc c) : inc1ValoresLista xs

{-

inc1ValoresLista [1, 2]
= (inc 1) : inc1ValoresLista [2]
= (inc 1) : (inc 2) : inc1ValoresLista []
= (inc 1) : (inc 2) : []
= 2 : 3 : []
= [2, 3]

-}

quadValoresLista :: [Int] -> [Int]
quadValores [] = []
quadValoresLista (x:xs) (quadrado x) : quadValoresLista xs

