-- implementação de mergesort explicada

mergesort :: [Int] -> [Int] -- recebe uma lista de inteiros e tem como resultado uma lista de inteiros
mergesort [] = [] -- se a lista for vazia, o resultado é uma lista vazia
mergesort (a:[]) = [a] -- se a lista tiver apenas um elemento, o resultado é uma lista com esse elemento apenas.
mergesort list = gather (mergesort (take half list)) (mergesort (drop half list))
					where half = (div (length list) 2)

--temos que:
--(div (length list) 2) será metade do tamanho da lista
--take half list irá pegar a primeira metade da lista de números
--drop half list irá pegar a segunda metade da lista de números
--pois no mergesort nós sempre dividimos a lista na metade
--a função gather irá fazer a junção das duas partes de forma que fique na ordem.

gather :: [Int] -> [Int] -> [Int] -- quando chamada por mergesort, terá como entrada as duas listas que serão unidas
gather [] list = list
gather list [] = list -- se uma das listas for vazia, retorna a outra
gather first@(a:as) second@(b:bs) | a <= b = a:(gather as second)
								  | otherwise = b:(gather first bs)

--temos que:
--se o head da primeira lista for menor ou igual do que o head da segunda lista, ele será o primeiro elemento da lista resultante
--e o método gather é chamado novamente, de forma que o primeiro elemento da lista resultante não será considerado novamente.
--por exemplo, se fizermos gather [3,4] [1,2]
--(analisando de forma superficial, já que não existem atribuições em haskell da forma que estamos representando abaixo)
--teremos que a = 3 e b = 1, então (a <= b) é falso, entramos no 'otherwise'
--teremos então 1:(gather [3,4] [2])
--então na próxima recursão, temos-> 2:(gather [3,4] [])
--na próxima, teremos list [] (pois a segunda lista é vazia), logo o resultado desse passo é [3,4]
--voltando na recursão, teremos 2:[3,4] ou [2,3,4]
--voltando para o primeiro passo da recursão, teremos 1:[2,3,4] ou [1,2,3,4]
--o resultado de gather é: [1,2,3,4]

--implementação de quicksort explicada

quicksort :: [Int] -> [Int]
quicksort [] = [] -- se a lista for vazia, o resultado é uma lista vazia
quicksort (a:[]) = [a] -- se a lista tiver apenas um elemento, o resultado é uma lista com apenas um elemento
quicksort (a:as) = (quicksort (filter (<= a) as)) ++ [a] ++ (quicksort (filter (> a) as))
--na última linha temos que:
--a ideia é pegar todos os elementos menores ou iguais que o head da lista e colocá-los na frente do head
--e pegar todos os elementos maiores que o head atrás dele.
--logo temos a ideia de fazer [menores ou iguais que o head] ++ (head da lista) ++ [maiores que o head]
--sabemos que 
--filter :: (a -> Bool) -> [a] -> [a]
-- ou seja, ela vai, no caso do quicksort, ser camada duas vezes
--na primeira, ela receberá uma função que diz se um número é menor ou igual a o head da lista
--assim, temos a função (<= a)
--filter também recebe uma lista, que será, no caso do quicksort, o tail da lista.
--por que o tail e não a lista inteira? por que nós já sabemos onde o head da lista está. 
--Se colocarmos a lista inteira, entraremos num loop infinito pois nunca chegaremos nos casos base (lista vazia ou com um elemento)
--pois o head da lista nunca é retirado.
--assim, temos que (filter (<= a) as) e (filter (> a) as) irão pegar, respectivamente, os elementos menores ou iquais e os elementos maiores.
--como a ideia inicial, se fizermos apenas: (filter (<= a) as) ++ [a] ++ (filter (> a) as)
--isso não está correto. observe o caso [4,3,2,6,5]
--teremos [3,2] ++ [4] ++ [6,5], ou seja, [3,2,4,6,5]
--isso está incorreto.
--para resolver, devemos fazer quicksort das duas partes.
--corrigindo: (quickosrt (filter (<= a) as)) ++ [a] ++ (quicksort (filter (> a) as))