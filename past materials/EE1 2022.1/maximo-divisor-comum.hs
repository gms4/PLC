-- guigs --
mdc :: Int -> Int -> Int
mdc a b
  | a < 0 || b < 0    = error "insira numero nao nulos"
  | b == 0            = a 
  | otherwise         = mdc b (mod a b)

