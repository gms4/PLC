-- DISCLAIMER: falta o MAIN de cada questão --

-- A: ELEVADO À --
{-
Defina a função potencia, de modo que potencia n k calcula N elevado a K. Sem recorrer a funções pré-definidas.
Utilize a seguinte função main para chamada de sua função potencia:
parseInput str = let [n, k] = map read (words str)
                 in (n, k)
main :: IO()
main = interact $ show . uncurry potencia . parseInput
-}

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

-- B: QUANTAS DIVISÕES EXATAS --
{-
Defina função: numDiv:: Integral a => a −> a −> a
Que recebe dois valores inteiros e retorna o número de vezes que uma divisão exata pode ser realizada, neste processo de substituir o dividendo pelo quociente. O processo de divisões sucessivas deve terminar quando uma divisão exata não existe.
OBS: Defina numDiv recursivamente, usando guardas.
Dica: use as funções mod e div.
Voce pode utilizar a seguinte função main para auxiliar:
main = do
   a <- readLn
   b <- readLn
   print (numDiv (a :: Int) (b :: Int))
-}
-- Integral a => define o tipo de a (integral) --
-- A função recebe "a" e "a" e retorna "a", todos do mesmo tipo --
-- Enquanto numa definição normal de função (Int -> String -> Int), não existe dependência entre as variáveis --
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

-- C: QUAIS OS ÚNICOS? --
{-
Defina função: unicos :: [Int] −> [Int]
Que receba uma lista X e retorne os elementos de X que ocorrem uma única vez nela.
OBS: Não utilizar a função filter da biblioteca.
Voce pode utilizar a seguinte função main para auxiliar:
main = do
  x <- getLine
  print $ unicos (map (read :: String -> Int) (words x))
-}
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
        | isEqual as a      = unique (popEqual a as) -- usando as (que é cauda) pq na vdd é uma lista, por isso coloquei isEqual as a
        | otherwise         = a : unique as


{-
> unique [4, 5, 7, 7]
    5 /= 4 -> [4] : unique [5, 7, 7]
    7 /= 5 -> [4] : [5] : unique [7, 7]
    7 == 7 -> [4, 5] : unique (popEqual 7 [7])
    [4, 5]
-}

-- E: JUNTE AS LISTAS --
{-
Defina uma função recursiva: merge :: Ord a => [a] -> [a] -> [a]
Que une duas listas ordenadas e resulta em uma única lista ordenada.
Você pode utilizar a seguinte função main para auxiliar:
main = do
  x <- getLine
  y <- getLine
  print $ merge (map (read :: String -> Int) (words x)) (map (read :: String -> Int) (words y))
-}
-- fazer merge entre listas já ordenadas (não vai funcionar pra input de listas não ordenadas) --
-- output é uma lista ordenada --
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x <= y      = x : merge xs (y:ys)
  | otherwise   = y : merge (x:xs) ys

{-
*Main>  
[1,2,4,3,7,9]
*Main> merge [2, 5, 6] [1, 3, 4]
[1,2,3,4,5,6]
*Main> merge [2,5,6] [1,3,4,7,8]
[1,2,3,4,5,6,7,8]
*Main> merge [2,5,6,7,8] [1,3,4]
[1,2,3,4,5,6,7,8]
*Main> merge [2,9,10] [1,3,4,7,8]
[1,2,3,4,7,8,9,10]
-}

{-
merge [1, 3, 4] [2, 7, 9]
    1 <= 2 TRUE -> [1] : merge [3, 4] [2, 7, 9]
    3 <= 2 FALSE -> [1] : [2] : merge [3, 4] [7, 9]
    3 <= 7 TRUE -> [1, 2] : [3] : merge [4] [7, 9]
    4 <= 7 TRUE -> [1, 2, 3] : [4] merge [] [7, 9]
    merge [] ys = ys = [9] -> [9] [7, 9]
    9 <= 7 FALSE -> [1, 2, 3, 4] : [7] : merge [9] [9]
    9 <= 9 TRUE -> [1, 2, 3, 4, 7] : [9] : merge [] [9]
    [1, 2, 3, 4, 7, 9] 
-}

-- G: SORT & MERGE --
{-
Usando merge, defina a função: msort :: Ord a => [a] −> [a]
Que implementa o merge sort, no qual uma lista vazia ou lista com um elemento está ordenada e qualquer outra lista é ordenada por mesclar as duas listas que resultam de ordenar as duas metades da lista separadamente.
Você pode utilizar a seguinte função main para auxiliar:
main = do
  x <- getLine
  print $ msort (map (read :: String -> Int) (words x))
-}
-- Recebe uma lista e retorna a mesma lista, mas ordenada --
-- Podemos fazer como um mergesort -> dividir, ordenar e juntar --
-- Essa função aqui vai ordenar até listas não ordenadas --
-- Função que divide a lista no meio --
halve :: [a] -> ([a],[a])
halve xs = (take half xs, drop half xs)
    where half = length xs `div` 2

{-
*Main> halve [1,2,3,4,5,6]
([1,2,3],[4,5,6])
halve [1,2,3,4,5,6,7]
([1,2,3],[4,5,6,7])
-}

-- Aqui a gente tá reaproveitando a função de merge feita lá em cima --
-- fst = primeiro item da tupla, snd = segundo item da tupla --5]
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort (fst halves)) (msort (snd halves))
    where halves = halve xs

{-
*Main> msort [3,1,5,2,5]
[1,2,3,5,5]
*Main> msort [3,1,5,2]
[1,2,3,5]
-}

-- D: REMOVA E DIVIDA --
{-
Defina função: remDiv:: Int −> [a] −> ([a],[a])
Tal que remDiv n x retorna o par (x1, x2) em que x1 tem os n−1 primeiros valores de x e x2 tem os n+1 valores de x.
Por exemplo: Se X é igual a [e1, e2, ..., e6], então:
remDiv 3 x => ([e1, e2], [e4, e5, e6])
remDiv 7 x => (x,[]).
Voce pode utilizar a seguinte função main para auxiliar:
main = do
  n <- readLn
  x <- getLine
  print $ remDiv (n :: Int) (words x)
-}
remDiv :: Int -> [a] -> ([a], [a])
remDiv itens lista = (take (itens-1) lista, drop itens lista)

{-
> remDiv 3 [1, 2, 3, 4, 5]
    - take (itens-1) lista = pegar até o item 2 da lista pra trás: (1, 2)
    - drop itens lista = dropar do item 3 pra trás: (4, 5)
    - output: ([1, 2], [4, 5])
-}


-- F: DIVIDA AS LISTAS --
{-
Defina a função: metade :: [a] −> ([a],[a])
Que divide uma lista em duas metades com tamanhos que diferem no máximo de 1 e de modo que todos os elementos de indices pares fiquem na primeira lista e todos de indices ímpares fiquem na segunda.
Você pode utilizar a seguinte função main para auxiliar:
main = do
  x <- getLine
  print $ metade (map (read :: String -> Int) (words x))
IMPORTANTE: não utilize nenhuma função de bibliotecas.
-}
-- Recebemos uma lista e temos que dividí-la em duas metades --
-- índices pares na primeira, índices ímpares na segunda --
-- Minha ideia é criar duas funções --
-- Uma retira os íncides pares da lista e a outra retira os índices ímpares --
-- Depois a gente lista as duas usando a funçao metade --

popEvenIndex :: [a] -> Int -> [a]
popEvenIndex [] _ = []
popEvenIndex (a:as) b
        | b `mod` 2 == 0        = [a] ++ popEvenIndex as (b+1)
        | otherwise             = popEvenIndex as (b+1)

{-
> popEven [1, 2, 3, 4] 1 (início da lista)
    1 mod 2 == 0 FALSE -> popEven [2, 3] 2
    2 mod 2 == 0 TRUE -> [2] ++ popEven [3] 3
    3 mod 2 == 0 FALSE -> [2] ++ popEven [4] 4
    4 mod 2 == 0 TRUE -> [2] ++ [4] ++ popEven [] 5
    output: [2, 4]
-}

popOddIndex :: [a] -> Int -> [a]
popOddIndex [] _ = []
popOddIndex (a:as) b
        | b `mod` 2 == 0        = popOddIndex as (b+1)
        | otherwise             = [a] ++ popOddIndex as (b+1)

{-
popOdd [1, 2, 3, 4] 1 (início da lista)
    1 mod 2 == 0 FALSE -> [1] ++ popOdd [2, 3, 4] 2
    2 mod 2 == 0 TRUE -> [1] ++ popOdd [3, 4] 3
    3 mod 2 == 0 FALSE -> [1] ++ [3] ++ popOdd [4] 4
    4 mod 2 == 0 TRUE -> [1, 3] ++ popOdd [] 5
    output: [1, 3]
-}

metade :: [a] -> ([a], [a])
metade xs = ((popOddIndex xs 1), (popEvenIndex xs 1))
{-
> metade [1, 2, 3, 4]
    ((popOdd [1, 2, 3, 4] 1), (popEven [1, 2, 3, 4] 1)) 
    ([1, 3], [2, 4])
-}



