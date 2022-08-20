quadrado :: Int -> Int
quadrado n = n ^ 2;

ehPar :: Int -> Bool
ehPar x =
	if ( mod x 2 == 0 ) then
		True
	else False

map1 :: (t -> u) -> [t] -> [u]   
map1 f [] = []
map1 f (a:x) = f a : map1 f x
