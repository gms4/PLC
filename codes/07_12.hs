import Data.Time.Format.ISO8601 (yearFormat)
import Distribution.Simple.Utils (xargs)

{-
Guardas

idFuncao :: Tipo
idFuncao idParams
 | guarda1 = exp1
 | guarda2 = exp2
 ...
 | guardaN = expN

 | not (guarda1) && not(guard2) && ...&& not(guardaN) = exp 
 | otherwise = exp

-}

maxi :: Int -> Int -> Int
maxi x y
  | x >= y    = x
  | otherwise = y

maior3Inteiros :: Int -> Int -> Int -> Int
maior3Inteiros x y z
 | x >= y && x >= z =  x
 | y >= z           = y
 | otherwise        = z

maxiIfThenElse :: Int -> Int -> Int
maxiIfThenElse x y = if x >= y then x else y


(>>>)  :: Int -> Int -> Int
(>>>) x y
  | x >= y    = x
  | otherwise = y

infixl 7 >>>

somaQuadrados :: Int -> Int -> Int
somaQuadrados x y =  quadX + quadY  --(x * x) + (y * y)
                     where 
                        quadX = x * x
                        quadY = y * y
    
somaQuadrados2 :: Int -> Int -> Int
somaQuadrados2 x y =  quad x + quad y  --(x * x) + (y * y)
                     where 
                        quad m = m * m

somaQuadrados3 :: Int -> Int -> Int
somaQuadrados3 x y = let quadX = x * x
                         quadY = y * y
                     in
                         quadX + quadY

{-
caso base       -> parada
caso recursivo  -> chamada recursiva

funRec :: Tipo
funRec param = caso base
funRec paran = caso recursivo

-}

-- Funcao recursiva (guardas)
fatorial :: Int -> Int
fatorial x 
  | x == 0     =  1
  | x > 0      = x * fatorial (x-1)

{-
fat 3 
= 3 * fat (3-1)
= 3 * fat 2
= 3 * 2 * fat (2-1)
= 3 * 2 * fat 1
= 3 * 2 * 1 * fat (1-1)
= 3 * 2 * 1 * fat 0
= 3 * 2 * 1 * 1
= 6 
-}

-- Funcao recursiva (casamento de padrao)
fatorialCasPad :: Int -> Int
fatorialCasPad  0   =  1
fatorialCasPad  n   = n * fatorialCasPad (n-1)

fat3 :: Int -> Int
fat3 n
  | n < 0  = -1
  | n == 0 = 1
  | n > 0  = n * fat3 (n-1)

fatMsg :: Int -> String
fatMsg n
 | n < 0  = "Erro: arqumento negativo para fatorial "
 | n >= 0 = "O resultado eh: " ++ show (fatorial n)


vendas :: Int -> Int
vendas 0 = 32
vendas 1 = 12
vendas 2 = 56
vendas 3 = 34


totalVendasGuardas :: Int -> Int
totalVendasGuardas n
  | n ==  0  = vendas 0
  | n >   0  = vendas n + totalVendasGuardas (n-1)


totalVendasCasPad :: Int -> Int
totalVendasCasPad 0 = vendas 0
totalVendasCasPad n = vendas n + totalVendasCasPad (n-1)