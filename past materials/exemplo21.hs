mostraLista [] = putStr ""
mostraLista (h:t) = do
	putStr((show h) ++"\n")
	mostraLista t
	