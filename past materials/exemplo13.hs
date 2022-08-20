mmc x y 
	| (x > y) && ( mod x y == 0 ) =  x
	| (y > x) && (mod y x == 0) = y
	| otherwise = x * y
	