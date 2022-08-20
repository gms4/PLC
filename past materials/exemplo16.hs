nomesA :: [String] -> [String] -> [String]
nomesA [] aux = aux
nomesA n aux =
	if (head (head n) == 'a') then
		nomesA (tail n) (aux++[head n])
	else
		nomesA (tail n) aux
		
main = 
	nomesA ["aline", "maria", "teodoro", "jose", "joao", "andre" , "otavio", "astrogildo", "sergio"] []
