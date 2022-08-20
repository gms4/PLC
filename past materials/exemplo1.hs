----------------------------
--  exemplo1.hs
----------------------------
import IO

aloMundo :: IO()
aloMundo =
	putStr("Alo Mundo!")
	
main = aloMundo

soma :: Int -> Int -> Int
soma x y = x + y

incrementa:: Int -> Int
incrementa = soma 1

f x = x + 1
g y = y * 4 
h z = (f . g) z

iteracao :: (a->a) -> Int -> (a->a)
iteracao f 1 = f
iteracao f n = iteracao f (n-1) . f

aluno :: String -> Int -> (String, Int)
aluno nome matricula = (nome, matricula)

somaPar :: (Int,Int) -> Int
somaPar (a,b) = a + b

somaDois :: Int -> Int -> Int
somaDois a b = a + b

tupla = (((0,1) , 2, 3) , 4)

type Numeros = (Int , Int, Int)

primeiro :: Numeros -> Int
segundo :: Numeros -> Int
terceiro :: Numeros -> Int

primeiro (a,b,c) = a
segundo (a,b,c) = b
terceiro (a,b,c) = c

-- tupla1::( Tipo1, Tipo2, ... , TipoN )
-- tupla1 = (1, 2, "tupla", 'c', True)
-- nTupla :: (t) -> Int -> t

['H', 'a', 's', 'k', 'e', 'l', 'l'] :: [Char]
[ 1 , 2 , 3 , 4 , 5 ] :: [Int]
[ 1.0 , 2.0 , 3.0 ] :: [Float]
[ True , False , False ] :: [Bool]

[[1,2,3], [2,3], [3,4,5,6]] :: [[Int]]
[(1,'a'), (2, 'b') , (3, 'c')] :: [(Int, Char)]
[(/), (**), logBase] :: [Float -> Float -> Float]

[1] = 1 : []
[1, 2, 3, 4] = 1 : 2 : 3 : 4 : []
( 0 , 'z'):[(9 , 'y')]
True:[True, False, False]



