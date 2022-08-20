imprimeN n s =
	if (n /= 0) then
		do
			putStr(s ++"\n")
			imprimeN (n-1) s
	else
		putStr("")

main = 
	do
		putStr("Digite uma string: ")
		x <- getLine
		putStr("Digite um numero: ")
		y <- getLine
		imprimeN (read y) x
		