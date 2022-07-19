umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b/(2.0 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d-e, d+e)
            where
              d = -b / 2.0 * a
              e = sqrt(b ^ 2 - 4.0 * a * c) / (2.0 * a)

raizes :: Float -> Float -> Float -> String
raizes a b c 
  | b ^ 2 == 4.0 * a * c = show (umaRaiz a b c)
  | b ^ 2 > 4.0 * a * c  = (show r1) ++ " " ++ (show r2)
  | otherwise            = "Nao existem raizes"
      where 
        r1 = fst (duasRaizes a b c)
        r2 = snd (duasRaizes a b c)

-- palavra reservada: type
-- type nomeTipo = tipo

type Nome = String
type Idade = Int
type NumTel = String
type Pessoa = (Nome, Idade, NumTel)

nome :: Pessoa -> Nome
nome (n, i, nT) = n

nomeIdade :: Pessoa -> String
nomeIdade (n, i, nT) = n ++ " tem " ++ show i ++ " de idade"

-- LISTAS --
-- compreensão de listas --
-- [ 2 * x  | x <- [1, 2, 3, 4] ] = [2,4,6,8]
-- [ x ^ 3 | x <- [1 .. 4], y <- [15..20]   =
-- [1,1,1,1,1,1,8,8,8,8,8,8,27,27,27,27,27,27,64,64,64,64,64,64]

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

-- [x | x <- [1..20], ehPar x, x > 15] = [16,18,20]
-- [x | x <- [1..20], (x < 3 || x > 7), ehPar x ][2,8,10,12,14,16,18,20]

todosPares :: [Int] -> [Int]
todosPares l = [ x | x <- l, ehPar x]

tamLista :: [Int] -> Int
tamLista [] = 0 -- caso base
tamLista (x:xs) = 1 + tamLista xs -- caso recursivo