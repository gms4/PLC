-- gms4 --
filterNegatives :: [Double] -> [Double]
filterNegatives [] = []
filterNegatives xs = filter (\xs -> xs >= 0) xs
  
transformSqrt :: [Double] -> [Double]
transformSqrt [] = []
transformSqrt xs = map sqrt xs

somaSqrt :: [Double] -> Double
somaSqrt [] = 0
somaSqrt xs = foldr (+) 0 (transformSqrt(filterNegatives xs))

-- rspf --
somaSqrt2:: [Double] -> Double
somaSqrt2 lista = foldr (+) 0 listaSqrt
  where listaFiltrada = filter (>0) lista
        listaSqrt     = map sqrt listaFiltrada

