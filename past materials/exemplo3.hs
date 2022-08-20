fatorial :: Int -> Int
fatorial n			  
  | n == 0  = 1
  | n == 1 = 1
  | n > 0    = (n * fatorial (n-1))

fatorial 0 = 1
fatorial 1 = 1
fatorial n = (n * fatorial (n-1))
