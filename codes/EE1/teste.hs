import Distribution.Simple.Utils (xargs)


funcaoConstante :: Int 
funcaoConstante = 30

maiorQue30 :: Int -> Bool
maiorQue30 x = x > 30

quadrado :: Int -> Int
quadrado x = x * x

exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)

-- casamento de padrao
mnot :: Bool -> Bool
mnot True  = False
mnot False = True

exOrCasamentoPadrao0 :: Bool -> Bool -> Bool
exOrCasamentoPadrao0 True True = False
exOrCasamentoPadrao0 True False = True
exOrCasamentoPadrao0 False True = True
exOrCasamentoPadrao0 False False = False


exOrCasamentoPadrao :: Bool -> Bool -> Bool
exOrCasamentoPadrao True x = not x
exOrCasamentoPadrao False x =  x

exOrCasamentoPadrao3 :: Bool -> Bool -> Bool
exOrCasamentoPadrao3 True x = not x
exOrCasamentoPadrao3 _ x = x

tresValoresIguais :: Int -> Int -> Int -> Bool
tresValoresIguais x y z = (x == y) && (y == z)
