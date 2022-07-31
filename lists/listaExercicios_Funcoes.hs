--Q1
dobro:: Integer -> Integer
dobro x = 2*x

--Q2
quadruplo:: Integer -> Integer
quadruplo x = dobro (dobro x)

--Q3
poli2:: Double -> Double -> Double -> Double -> Double
poli2 a b c x = a*x^2 + b*x + c

--Q4
parImpar:: Int -> String
parImpar x | x < 0       = parImpar (abs x)
           | x == 0      = "Par"
           | x == 1      = "Impar"
           | otherwise   = parImpar (x-2)

--Q5
maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c | a > b && a > c  = a
               | b > a && b > c  = b
               | otherwise       = c

maxFour1 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour1 a b c x | maxABC > x  = maxABC
                | otherwise   = x
                where maxABC = maxThree a b c

maxFour2 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour2 a b c x = max(max a b) (max c x)

maxFour3 :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour3 a b c x = max (maxThree a b c) x

--Q6
quantosIguais :: Integer -> Integer -> Integer -> Integer
quantosIguais a b c | (a==b) && (b==c)           = 3
                    | (a==b) || (b==c) || (a==c) = 2
                    | otherwise                  = 0

--Q7
ehZero :: Int -> Bool
ehZero 0 = True
ehZero n = False

--Q8
sumTo :: Integer -> Integer
sumTo n | n < 0       = - (sumTo (negative-1) + negative)
        | n == 1      = 1
        | otherwise   = sumTo (positive-1) + positive
        where negative = abs n
              positive = n

--Q9
potencia :: Int -> Int -> Int
potencia a 1     = a
potencia a b     = a * potencia a (b-1)

--Q10
cBinomial :: Int -> Int -> Int
cBinomial a b | (a==0) && (b>0) = 0
              | (b==0)          = 1
              | otherwise       = cBinomial (a-1) b + cBinomial (a-1) (b-1)

--Q11: Tribonacci
-- tribonacci :: Int -> Int
-- tribonacci x | (x == 1) || (x == 2)       = 1
--              | (x == 3)                   = 2
--              | otherwise                  = tribona

--Q12
addEspacos :: Int -> String
addEspacos x | x == 0    = ""
             | otherwise = " " ++ addEspacos (x-1)

--Q13
paraDireita :: Int -> String -> String
paraDireita a b = addEspacos a ++ b

--Q14: imprimeTabela