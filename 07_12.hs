maxi :: Int -> Int -> Int
maxi x y 
  | x >= y     = x
  | otherwise  = y

maior3Inteiros :: Int -> Int -> Int -> Int
maior3Inteiros x y z
  | x >= y && x >= z   = x
  | y >= z             = y
  | otherwise          = z

maxiIfThenElse :: Int -> Int -> Int
maxiIfThenElse x y = if x >= y then x else y

(>>>) :: Int -> Int -> Int
(>>>) x y
    | x >= y    = x
    | otherwise = y

somaQuadrados :: Int -> Int -> Int
somaQuadrados x y = quadX + quadY
                    where
                        quadX = x * x
                        quadY = y * y

somaQuadrados2 :: Int -> Int -> Int
somaQuadrados2 x y = quad x + quad y
                     where
                        quad m = m * m

{-

caso base -> parada
caso recursivo -> chamada recursiva

funRec :: Tipo
funRec param = caso base
funRec paran = caso recursivo

-}

fatorial :: Integer -> Integer
fatorial x
  | x == 0   = 1
  | x > 0    = x * fatorial (x-1)

--função recursiva "casamento padrão"

fatorialCasPad :: Int -> Int
fatorialCasPad 0 = 1
fatorialCasPad n = n * fatorialCasPad(n-1)

fat3 :: Int -> Int
fat3 n
  | n < 0   = -1
  | n == 0  = 1
  | n > 0   = n * fat3(n-1)

fatMsg :: Int -> String
fatMsg n
  | n < 0 = "Erro: argumento negativo"
  | n >= 0 = "O resultado eh: " ++ show (fat3 n)