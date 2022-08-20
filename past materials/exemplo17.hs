equacao :: Float -> Float -> Float -> IO()
equacao a b c =
	putStr("As raizes sao " ++(show x1) ++ " " ++ (show x2))
	where
		x1 = ((-b + sqrt(b^^2 - 4 * a * c))/(2 * a)) 
		x2 = ((-b - sqrt(b^^2 - 4 * a * c))/(2 * a)) 
			