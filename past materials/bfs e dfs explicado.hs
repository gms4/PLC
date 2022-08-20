--DFS e BFS explicados:
--recebem um grafo e um valor, retornando true se o valor estiver no grafo ou false se não.
--considerando que não existem nós com valores repetidos!

--Tipo de dados algébrico para grafo (comparável)
data Grafo t = Vazio | No t [Grafo t] deriving (Eq,Show)
--cada No tem um valor e uma lista de adjacencia

dfs :: (Eq t) => Grafo t -> t -> Bool
dfs (Vazio) n = False
dfs grafo@(No valor adj) n = (fazerDfs n [grafo] [valor])
--usaremos uma função fazerDfs para saber quem já foi visitado e termos a pilha
--[grafo] é a pilha
--[valor] é a lista de visitados

fazerDfs :: (Eq t) => t -> [Grafo t] -> [t] -> Bool
fazerDfs n [] _ = False -- se todos os nós foram visitados (a pilha está vazia), o resultado é False, pois o valor não foi encontrado
fazerDfs n ((No valor adj):as) visitados | valor == n = True -- se o valor do nó em que estamos é o valor procurado, true
										 | otherwise = (fazerDfs n (pilha ++ as) (valor:visitados))
										 	where pilha = [(No v ad) | (No v ad) <- adj, (filter (==v) visitados) == []]
--vamos explicar o 'otherwise':
--se o valor não foi encontrado, teremos que fazer a dfs no novo topo da pilha.
--primeiramente, temos que atualizar a pilha, ou seja, 
--para cada nó adjacente ao nó atual, temos que colocá-lo na pilha (se tal nó não foi visitado antes).
--ou seja, teremos que ver se existem nós em adj que não foram visitados
--se isso (filter (==v) visitados) == [] ocorre, é por que o No com valor v não foi visitado ainda.
--para isso, fazemos compreensão de listas
--[(No v ad) | (No v ad) <- adj, (filter (==v) visitados) == []]
--se o nó com valor v não foi visitado, ele é colocado nessa lista.
--essa lista resultante (em pilha) é concatenada com 'as' (por que o topo da lista será retirado da pilha da dfs).
--então, como é uma pilha, faremos (pilha ++ as).
--então colocamos o valor em visitados da seguinte forma: (valor:visitados)
-- e a dfs é feita novamente.

--e se fosse uma BFS?
--Uma bfs usa uma fila, ao invés de pilha.
--numa fila, o primeiro que entra é o primeiro que sai. então devemos adicionar os nós no fim da fila,
--assim, faríamos (adaptando nomes):
--otherwise = (fazerBfs n (as ++ fila) (valor:visitados))
--	where fila = [(No v ad) | (No v ad) <- adj, (filter (==v) visitados) == []]