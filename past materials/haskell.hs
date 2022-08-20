------------------------------------------------------------------
--1--programa dos limoes

limao_frase::Int->String
limao_frase n = show n ++ if n==1 
   then " limao "++" meio limao "++ show (n+1)++" limoes"
   else " limoes " ++ " meio limao " ++ show (n+1) ++ " limoes "

repete_frase:: Int->Int->String
repete_frase a b = if a<=b
   then limao_frase a ++ repete_frase (a+1) b else " "

limao:: Int->String
limao n = repete_frase 1 n

---------------------------------------------------------------------

--2

mostra_lista [] = " "
mostra_lista (a:b) = show a ++ mostra_lista b


leValores n = do
            putStr ("Digite um valor: ")
            num <- getLine
            if n <= 1
                   then return []
                   else do
                          nuns <- leValores (n-1)
                          return ([num] ++ nuns)

soma []=0
soma (a:b)= a + soma b 

--tam_lista = do--esse funçao nao esta funcionando 
	 --putStr("Digite o tamanho da lista")
	-- tam <-getLine
	-- if tam ==""
		--then return []
	 	--else do
	          -- nomes <- leNomes tam
		 --  return ([tam] ++ nomes)

----------------------------------------------------------------------

--3--media dos elementos de uma lista


nElementos [] = 0--contar o numero de elementos
nElementos (a:b) = 1 + nElementos b

somaElementos [] = 0--soma todos os valores da lista
somaElementos (a:b) = a + somaElementos b

mediaElementos [] = 0--calcula a media aritmetica
mediaElementos (a:b) = somaElementos (a:b) / nElementos (a:b)


--4
processa_lista list=[2*a|a<-list]

--5

-- itera :: Int->Int->Int->Int
--itera z c iter maxiter = if (magnitude z)<2&&(iter<maxiter)then itera (z*z+c) c (iter+1) maxiter else iter




