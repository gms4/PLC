a)((:).foldr.foldr) (:)

Dados {
	(:) :: a -> [a] -> [a]
	(.) :: (b -> c) -> (d -> b) -> d -> c
	foldr :: (e -> f -> f) -> f -> [e] -> f
}

(b->c) = a -> [a] -> [a]
b = a
c = [a] -> [a]

(d -> b) = (e -> f -> f) -> f -> [e] -> f
d = (e -> f -> f)
b = f -> [e] -> f

a = f -> [e] -> f

(:).foldr :: d -> c
(:).foldr :: (e -> f -> f) -> [a] -> [a]
(:).foldr :: (e -> f -> f) -> [f -> [e] -> f] -> [f -> [e] -> f]

(b -> c) = (e -> f -> f) -> [f -> [e] -> f] -> [f -> [e] -> f]
b = (e -> f -> f)
c = [f -> [e] -> f] -> [f -> [e] -> f]

(d -> b) = (x -> y -> y) -> y -> [x] -> y
d = (x -> y -> y)
b = y -> [x] -> y

(e -> f -> f) = y -> [x] -> y
e = y
f = [x]
f = y
y = [x]

(:).foldr.foldr :: d -> c
(:).foldr.foldr ::(x -> y -> y) -> [f -> [e] -> f] -> [f -> [e] -> f]
(:).foldr.foldr ::(x -> [x] -> [x]) -> [[x] -> [[x]] -> [x]] -> [[x] -> [[x]] -> [x]]

(x -> [x] -> [x]) = a -> [a] -> [a]
x = a
[x] = [a]
[x] = [a]

((:).foldr.foldr) (:) :: [[a] -> [[a]] -> [a]] -> [[a] -> [[a]] -> [a]]





b)map.map.foldr

Dados {
	map :: (a -> b) -> [a] -> [b]
	(.) :: (y -> z) -> (x -> y) -> x -> z
	foldr :: (e -> f -> f) -> f -> [e] -> f
}

(y -> z) = (a -> b) -> [a] -> [b]
y = (a -> b)
z = [a] -> [b]

(x -> y) = (e -> f -> f) -> f -> [e] -> f
x = (e -> f -> f)
y = f -> [e] -> f

(a -> b) = f -> [e] -> f
a = f
b = [e] -> f

map.foldr :: x -> z
map.foldr :: (e -> f -> f) -> [f] -> [b]
map.foldr :: (e -> f -> f) -> [f] -> [[e] -> f]

(y -> z) = (a -> b) -> [a] -> [b]
y = (a -> b)
z = [a] -> [b]

(x -> y) = (e -> f -> f) -> [f] -> [[e] -> f]
x = (e -> f -> f)
y = [f] -> [[e] -> f]

(a -> b) = [f] -> [[e] -> f]
a = [f]
b = [[e] -> f]

map.map.foldr :: x -> z
map.map.foldr :: (e -> f -> f) -> [[f]] -> [[[e] -> f]]





c)foldr.foldr.foldl

Dados {
	foldl :: (a -> b -> a) -> a -> [b] -> a
	(.) :: (y -> z) -> (x -> y) -> x -> z
	foldr :: (e -> f -> f) -> f -> [e] -> f
}

(y -> z) = (e -> f -> f) -> f -> [e] -> f
y = (e -> f -> f)
z = f -> [e] -> f

(x -> y) = (a -> b -> a) -> a -> [b] -> a
x = (a -> b -> a)
y = a -> [b] -> a

(e -> f -> f) = a -> [b] -> a
e = a
f = [b]
f = a
a = [b]

foldr.foldl :: x -> z
foldr.foldl :: (a -> b -> a) -> f -> [e] -> f
foldr.foldl :: ([b] -> b -> [b]) -> [b] -> [[b]] -> [b]


(y -> z) = (e -> f -> f) -> f -> [e] -> f
y = (e -> f -> f)
z = f -> [e] -> f

(x -> y) = ([b] -> b -> [b]) -> [b] -> [[b]] -> [b]
x = ([b] -> b -> [b])
y = [b] -> [[b]] -> [b]

(e -> f -> f) = [b] -> [[b]] -> [b]
e = [b]
f = [[b]]
f = [b]
[[b]] = [b]
Logo, deu pau! Pois não tem como [b] ser igual a [[b]].





d)foldl.foldr.foldl

Dados {
	foldl :: (a -> b -> a) -> a -> [b] -> a
	(.) :: (y -> z) -> (x -> y) -> x -> z
	foldr :: (e -> f -> f) -> f -> [e] -> f
}

(y -> z) = (a -> b -> a) -> a -> [b] -> a
y = (a -> b -> a)
z = a -> [b] -> a

(x -> y) = (e -> f -> f) -> f -> [e] -> f
x = (e -> f -> f)
y = f -> [e] -> f

(a -> b -> a) = f -> [e] -> f
a = f
b = [e]
a = f

foldl.foldr :: x -> z
foldl.foldr :: (e -> f -> f) -> f -> [[e]] -> f

(y -> z) = (e -> f -> f) -> f -> [[e]] -> f
y = (e -> f -> f)
z = f -> [[e]] -> f

(x -> y) = (a -> b -> a) -> a -> [b] -> a
x = (a -> b -> a)
y = a -> [b] -> a

(e -> f -> f) = a -> [b] -> a
e = a
f = [b]
f = a
a = [b]

foldl.foldr.foldl :: x -> z
foldl.foldr.foldl :: ([b] -> b -> [b]) -> [b] -> [[[b]]] -> [b]





e)map.(foldr(/2))

Dados {
	2 :: Num a => a
	map :: (a -> b) -> [a] -> [b]
	(/) :: Fractional w => w -> w -> w
	(.) :: (y -> z) -> (x -> y) -> x -> z
	foldr :: (e -> f -> f) -> f -> [e] -> f
}

(/2) :: (Fractional w) => w -> w

(e -> f -> f) = w -> w
e = w
(f -> f) = w

foldr(/2) :: (Fractional w) => f -> [e] -> f
foldr(/2) :: (Fractional (f -> f)) => f -> [(f -> f)] -> f

(y -> z) = (a -> b) -> [a] -> [b]
y = (a -> b)
z = [a] -> [b]

(x -> y) = f -> [(f -> f)] -> f
x = f
y = [(f -> f)] -> f

(a -> b) = [(f -> f)] -> f
a = [f -> f]
b = f

map.(foldr(/2)) :: x -> z
map.(foldr(/2)) :: f -> [a] -> [b]
map.(foldr(/2)) ::(Fractional (f -> f)) => f -> [[f -> f]] -> [f]
