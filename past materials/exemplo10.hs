pegaNota :: [(String, Int)] -> String -> Int
pegaNota [] nome = 0
pegaNota ((nome, nota):t) n 
	| n == nome = nota
	| n /= nome = pegaNota t n
	