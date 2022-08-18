-- TIPOS RECURSVIVOS -- 

data Expr = Lit Int
            | Add Expr Expr
            | Sub Expr Expr


exp1 = Lit 1
exp2 = Add (Lit 1) (Add (Lit 2) (Lit 3))
exp3 = Sub (Add (Lit 6) (Lit 8)) (Add (Sub (Lit 4) (Lit 2)) (Lit 1))

eval :: Expr -> Int
eval (Lit n)        = n
eval (Add e1 e2)    = eval e1 + eval e2
eval (Sub e1 e2)    = eval e1 - eval e2

{-

eval (Add (Lit 1) (Add (Lit 2) (Lit 3)))
= eval (Lit 1) + eval (Add (Lit 2) (Lit 3))
= 1 + (eval (Lit 2) + eval (Lit 3))
= 1 + (2 + 3)
= 6

-}

mshow :: Expr -> String
mshow (Lit n)       = show n
mshow (Add e1 e2)   = "(" ++ mshow e1 ++ " + " ++ mshow e2 ++ ")"
mshow (Sub e1 e2)   = "(" ++ mshow e1 ++ " - " ++ mshow e2 ++ ")"

-- ÁRVORES (inteiros) --

data ArvoreInt = NilArvInt | No Int ArvoreInt ArvoreInt
                    deriving (Show)

arv1 = NilArvInt
arv2 = No 2 (NilArvInt) (No 3 NilArvInt NilArvInt)
arv3 = No 5 (No 3 NilArvInt NilArvInt) (No 7 NilArvInt NilArvInt)

somaArv :: ArvoreInt -> Int
somaArv (NilArvInt)         = 0
somaArv (No n arvE arvD)    = n + somaArv arvE + somaArv arvD

{-

somaArv(No 5 (No 3 NilArvInt NilArvInt) (No 7 NilArvInt NilArvInt))
= 5 + somaArv (No 3 NilArvInt NilArvInt) + somaArv (No 7 NilArvInt NilArvInt)
= 5 + 3 + somaArv NilArvInt + + somaArv NilArvInt + 7 + somaArv NilArvInt + somaArv NilArvInt
= 5 + 3 + 0 + 0 + 7 + 0 + 0
= 15

-}

numOcorrencias :: ArvoreInt -> Int -> Int
numOcorrencias (NilArvInt) n        = 0
numOcorrencias (No x aE aD) n
    | n == x        = 1 + numOcorrencias aE n + numOcorrencias aD n
    | otherwise     = numOcorrencias aE n + numOcorrencias aD n

{-

*Main> numOcorrencias arv2 2
1
*Main> numOcorrencias arv2 10
0
*Main> numOcorrencias arv3 5
1
*Main> numOcorrencias arv3 7
1

-}

-- TIPO ALGÉBRICO RECURSIVO POLIMORFICO --

data Arvore t = Nil | Noo t (Arvore t) (Arvore t)
                    deriving (Show)

arvP1 = (Noo 3 (Noo 2 Nil Nil) Nil)
arvP2 = (Noo 3 (Noo 2 Nil Nil) (Noo 7 (Noo 5 Nil Nil) (Noo 8 Nil Nil)))

collapse :: Arvore t -> [t]
collapse (Nil) = []
collapse (Noo x aE aD) = collapse aE ++ [x] ++ collapse aD  

{-

*Main> collapse arvP2
[2,3,5,7,8]
*Main> collapse arvP1
[2,3]

-}

-- NilL pq é uma lista

data Lista t = NilL | Cons t (Lista t)
                deriving (Show)

l1 = NilL
l2 = Cons 2 (Cons 3 (Cons 4 (Cons 5 NilL)))         

listaParaLPadrao :: Lista t -> [t]
listaParaLPadrao NilL               = []
listaParaLPadrao (Cons x lista)     = x : listaParaLPadrao lista

{- 
*Main> listaParaLPadrao l2
[2,3,4,5] 
-}

data MMaybe a = MNothing | MJust a
                deriving (Show)

mDiv :: Int -> Int -> Int
mDiv x y = div x y 

{- 
*Main> mDiv 4 0
*** Exception: divide by zero 
-}

safeDiv :: Int -> Int -> MMaybe Int
safeDiv x 0         = MNothing
safeDiv x y         = MJust (div x y)

{- 
*Main> safeDiv 4 0
MNothing
*Main> safeDiv 4 2
MJust 2
-}

novaDiv :: Int -> Int -> String
novaDiv x y = case (safeDiv x y) of
                MNothing -> "Divisao por zero"
                MJust z  -> "A divisao de " ++ show x ++ " por " ++ show y ++ " resulta em " ++ show z

{- 
*Main> novaDiv 4 0
"Divisao por zero"
*Main> novaDiv 4 2
"A divisao de 4 por 2 resulta em 2"
-}

