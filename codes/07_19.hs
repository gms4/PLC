umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b /( 2.0 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float) 
duasRaizes a b c = (d-e, d +e)
             where
                d = -b / 2.0 * a
                e = sqrt( b ^ 2 - 4.0 * a * c) / (2.0 * a)

raizes :: Float -> Float -> Float -> String
raizes a b c
 | b ^ 2 == 4.0 * a * c = show (umaRaiz a b c)
 | b ^ 2 > 4.0 * a * c  = (show r1) ++ " " ++ (show r2)
 | otherwise            = "Nao hah raizes"
     where
        r1 = fst (duasRaizes a b c)
        r2 = snd (duasRaizes a b c)

-- Sinonimo de tipos

-- Palavra reservada : type
-- type NomeTipo = tipo

type Nome   = String
type Idade  = Int
type NumTel = String
type Pessoa = (Nome, Idade, NumTel)

-- type String = [Char]

nome :: Pessoa -> Nome
nome (n, i, nT) = n

nomeIdade :: Pessoa -> String
nomeIdade (n, i, nT) = n ++ " tem " ++ show i ++ " de idade"

-- Listas

-- Compreensao de listas
-- {xˆ2 | x e N}
-- [ expressao | x <- listaGeradora ]

{-
*Main> [1,2,3,4]
[1,2,3,4]
*Main> [ 2 * x | x <- [1,2,3,4]  ]
[2,4,6,8]
*Main> [ 2 * x | x <- [1 .. 4]  ]
[2,4,6,8]
*Main> [ x ^2 | x <- [1 .. 4]  ]
[1,4,9,16]
*Main> [ x ^ 3 | x <- [1 .. 4]  ]
[1,8,27,64]
-}

-- [ expressao | x <- listaGeradora, filtro ]
{-
*Main> [x | x <- [1..20], x > 15]
[16,17,18,19,20]
*Main> [x | x <- [1..20], x `mod` 2 == 0]
[2,4,6,8,10,12,14,16,18,20]
*Main> [x | x <- [1..20], x `mod` 2 == 0, x > 15]
[16,18,20]
*Main> [x | x <- [1..20], x `mod` 2 == 0 && x > 15]
[16,18,20]
*Main> [x | x <- [1..20], ehPar x, x > 15]
[16,18,20]
*Main> [x | x <- [1..20], (x < 3 || x > 7)]
[1,2,8,9,10,11,12,13,14,15,16,17,18,19,20]
*Main> [x | x <- [1..20], (x < 3 || x > 7), ehPar x]
[2,8,10,12,14,16,18,20]
*Main> [ x + y | (x,y) <- [(1,2), (3,4), (5,6), (7,8)] ]
[3,7,11,15]
*Main> [ fst p  +  snd p | p <- [(1,2), (3,4), (5,6), (7,8)] ]
[3,7,11,15]
*Main> [(a, b, c)  | a <- [1..10], b <- [1..10], c <- [1..10], (a ^2 + b^2 == c^2)]
[(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
*Main> [(a, b, c)  | a <- [1..100], b <- [1..100], c <- [1..100], (a ^2 + b^2 == c^2),(a+b+c==24)]
[(6,8,10),(8,6,10)]
*Main>
-}

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0


todosPares :: [Int] -> [Int]
todosPares l = [ x | x <- l , ehPar x]

tamLista :: [Int] -> Int
tamLista []     = 0                 -- caso base
tamLista (x:xs) = 1 + tamLista xs   -- caso recursivo

{-
*Main> tamLista []
0
*Main> tamLista [1..5]
5
*Main> :t (:)
(:) :: a -> [a] -> [a]
*Main> 1 : []
[1]
-}