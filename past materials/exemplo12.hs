divisiveis :: Int -> Int -> IO()
divisiveis n 0 = putStr("Programa finalizado!")
divisiveis n cont =
	if (mod n cont == 0) then
		do
			putStr((show cont) ++ "\n")
			(divisiveis n (cont-1))
	else (divisiveis n (cont-1))
	
main = do
	putStr("Digite um numero: ")
	x <- getLine
	divisiveis (read x) (read x)