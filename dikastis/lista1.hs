-- A: Elevado à --
{-
> potencia 2 4
    2 * potencia 2 3
    2 * 2 * potencia 2 2
    2 * 2 * 2 * potencia 2 1
    2 * 2 * 2 * 2 = 16 = 2^4
-}

potencia :: Int -> Int -> Int
potencia n k 
        | k < 0         = error "Insira um numero natural"
        | k == 0        = 1
        | k == 1        = n
potencia n k = n * potencia n (k-1)

-- B: Quantas divisões exatas --
-- Integral a => define o tipo de a (integral) --
-- A função recebe a e a e retorna a --
{-
> numDiv 8 2
    1 + numDiv (8/2) 2 = 1 + numDiv 4 2
    1 + 1 + numDiv (4/2) 2 = 2 + numDiv 2 2
    2 + 1 + numDiv (2/2) 2 = 3 + numDiv 1 2
    3 + 0 
    3
-}

numDiv :: Integral a => a -> a -> a
numDiv a b
        | a `mod` b /= 0          = 0
        | otherwise               = 1 + numDiv (a `div` b) b

-- C: Quais os únicos? --

-- Função que retira repetidos dados --
{-
> popEqual 2 [2, 4, 2, 5]
    2 == 2 -> popEqual 2 [4, 2, 5]
    2 /= 4 -> [4] : popEqual 2 [2, 5]
    2 == 2 -> [4] : popEqual 2 [5]
    2 /= 5 -> [4] : [5]
    [4, 5]
-}
popEqual :: Int -> [Int] -> [Int]
popEqual _ []           = []
popEqual a (b:bs)
        | a == b        = popEqual a bs
        | otherwise     = b : popEqual a bs

-- Função que diz se o elemento é igual ou não ao elemento dado --
isEqual :: (Eq a) => [a] -> a -> Bool
isEqual [] _ = False
isEqual (a:as) b
        | a == b        = True
        | otherwise     = isEqual as b

{-
> isEqual [4, 5, 7, 7] 7
    isEqual [5, 7, 7]
    isEqual [7, 7]
    True
-}

-- Função final --
unique :: [Int] -> [Int]
unique [] = []
unique (a:as)
        | isEqual as a      = unique (popEqual a as) -- as cauda na vdd é uma lista, por isso coloquei isEqual as a
        | otherwise         = a : unique as


{-
> unique [4, 5, 7, 7]
    5 /= 4 -> [4] : unique [5, 7, 7]
    7 /= 5 -> [4] : [5] : unique [7, 7]
    7 == 7 -> [4, 5] : unicos (popEqual 7 [7])
    [4, 5]
-}