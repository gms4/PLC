-- guigs --
mdc :: Int -> Int -> Int
mdc a b
  | a < 0 || b < 0    = error "insira numero nao nulos"
  | b == 0            = a 
  | otherwise         = mdc b (mod a b)

-- belinha --
mdc2 :: Int -> Int -> Int
mdc2 a b
    | (a - ((div a b) * b)) == 0 = b
    | otherwise = mdc2 b (a - ((div a b) * b))