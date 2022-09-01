module Pilha ( Pilha (Stack), pilhaVazia, push, pop) where
	data Pilha t = Stack [t]
	push :: t -> Pilha t -> Pilha t
	push x (Stack y) = Stack (x:y)
	pop :: Pilha t -> t
	pop (Stack []) = error "Pilha vazia!!"
	pop (Stack (a:b)) = a
	pilhaVazia :: Pilha t
	pilhaVazia = Stack []
	
	