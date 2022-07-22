main = putStrLn "Hello, World!"

--Q1

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = (menor, maior)
  where menor | a < b && a < c   = a
              | b < a && b < c   = b
              | otherwise        = c
        maior | a > b && a > c   = a
              | b > a && b > c   = b
              | otherwise        = c

--Q3

type Ponto = ( Float , Float)
type Reta = (Ponto , Ponto )

getX :: Ponto -> Float
getX (a,b) = a

getY :: Ponto -> Float
getY (a,b) = b

lineIsVertical :: Reta -> Bool
lineIsVertical (a,b) | firstX == secondX   = True
                     | otherwise           = False
  where firstX = getX a
        secondX = getX b