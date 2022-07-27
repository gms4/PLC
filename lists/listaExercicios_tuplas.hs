--q1
menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = (menor, maior)
  where menor | a < b && a < c   = a
              | b < a && b < c   = b
              | otherwise        = c
        maior | a > b && a > c   = a
              | b > a && b > c   = b
              | otherwise        = c

--q2 
ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c) = (menor, medio, maior)
  where (menor,maior) = menorMaior a b c
        medio | a /= menor && a /= maior = a 
              | b /= menor && b /= maior = b
              | otherwise                = c

--q3
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

--q4
pontoY :: Float -> Reta -> Float
pontoY xFinal (ponto1, ponto2) = yFinal
  where 
    yFinal = aux + y1
    aux = ((y2 - y1)/(x2 - x1))*(xFinal - x1)
    x1 = getX ponto1
    y1 = getY ponto1
    x2 = getX ponto2
    y2 = getY ponto2