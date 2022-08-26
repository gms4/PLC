--q1
potencia :: Int -> Int -> Int
potencia n k | k < 0      = error "Expoentes negativos não são aceitos"
             | k == 0     = 1
             | k == 1     = n
             | otherwise  = n * potencia n (k-1)

--q2
numDiv:: Integral a => a -> a -> a
numDiv num divisor 
            | divisor == 1           = error "Insira um divisor que não seja 1" -- Evita loop infinito
            | num `mod` divisor /= 0 = 0
            | otherwise              = 1 + numDiv numDivided divisor
               where numDivided = div num divisor
--q3
unicos :: [Int] -> [Int]
unicos lista 
            | lista == []     = []
            | isUnique        = cabeca:unicos cauda
            | otherwise       = unicos listaSemNum
               where cabeca      = head lista
                     cauda       = tail lista
                     isUnique    = not (isNumberFound cabeca cauda)
                     listaSemNum = dropNum cabeca cauda
             
isNumberFound :: Int -> [Int] -> Bool
isNumberFound num lista
            | lista == []           = False
            | cabeca == num         = True
            | otherwise             = isNumberFound num cauda
               where cabeca = head lista
                     cauda  = tail lista
             
dropNum :: Int -> [Int] -> [Int]
dropNum num lista
            | lista == []    = []
            | cabeca == num = dropNum num cauda
            | otherwise     = cabeca : dropNum num cauda
               where cabeca = head lista
                     cauda  = tail lista

--q4
remDiv:: Int -> [a] -> ([a],[a])
remDiv num lista 
            | num <= 0       = error "Insira uma posicao positiva"
            | num > tamanho = error "Insira uma posicao que exista na lista"
            | otherwise     = (getFront num lista, getBack num lista)
               where tamanho   = length lista
             
getFront:: Int -> [a] -> [a]
getFront num (cabeca:cauda)
            | num /= 1      = cabeca : getFront (num-1) cauda
            | otherwise     = []
             
getBack:: Int -> [a] -> [a]
getBack num (cabeca:cauda)
            | num == 1      = cauda
            | otherwise     = getBack (num-1) cauda

--q5
merge :: Ord a => [a] -> [a] -> [a]
merge lista1 lista2
            | (lista1 == []) && (lista2 == [])  = []
            | lista1 == []                   = cabeca2 : merge lista1 cauda2
            | lista2 == []                   = cabeca1 : merge cauda1 lista2
            | cabeca1 < cabeca2              = cabeca1 : merge cauda1 lista2
            | otherwise                      = cabeca2 : merge lista1 cauda2
               where cabeca1 = head lista1
                     cauda1  = tail lista1
                     cabeca2 = head lista2
                     cauda2  = tail lista2

--q6
metade :: [a] -> ([a],[a])
metade lista = (listaImpares, listaPares)
            where listaImpares = extrairDoisADois lista 0
                  listaPares   = extrairDoisADois lista 1
             
extrairDoisADois :: [a] -> Int -> [a]
extrairDoisADois lista num
            | tamanho == 0  = []
            | num == 0      = cabeca: extrairDoisADois cauda 1
            | otherwise     = extrairDoisADois cauda 0
               where cabeca  = head lista
                     cauda   = tail lista
                     tamanho = length lista

--q7
msort :: Ord a => [a] -> [a]
msort lista 
    | lista == []    = []
    | tamanho == 1   = (head lista):[]
    | tamanho > 1    = merge (msort subList1) (msort subList2)
            where tamanho    = length lista
                  metade     = div tamanho 2
                  (subList1,subList2) = splitAt metade lista
             
merge2 :: Ord a => [a] -> [a] -> [a]
merge2 lista1 lista2
        | tamanho1 == 0      = lista2
        | tamanho2 == 0      = lista1
        | cabeca1 < cabeca2  = [cabeca1]++merge2 cauda1 lista2
        | otherwise          = [cabeca2]++merge2 lista1 cauda2
              
              where cabeca1  = head lista1
                    cabeca2  = head lista2
                    cauda1   = tail lista1
                    cauda2   = tail lista2
                    tamanho1 = length lista1
                    tamanho2 = length lista2