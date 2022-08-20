import System.IO.Unsafe
maior3 :: ( Int, Int, Int ) -> Int
maior3 ( a , b, c ) 
	| ((a >= b) && ( a >= c)) = a
	| ((b >= a) && (b >= c)) = b
	| ((c >= a) && ( c >= b)) = c
	
main = do
	let x = maior3 (1,2,3) in
		putStr("O maior e " ++ (show x))
		