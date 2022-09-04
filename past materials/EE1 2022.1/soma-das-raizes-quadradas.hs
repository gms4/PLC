-- guigs --
filterNegatives :: [Double] -> [Double]
filterNegatives [] = []
filterNegatives xs = filter (\xs -> xs >= 0) xs
  
transformSqrt :: [Double] -> [Double]
transformSqrt [] = []
transformSqrt xs = map sqrt xs

somaSqrt :: [Double] -> Double
somaSqrt [] = 0
somaSqrt xs = foldr (+) 0 (transformSqrt(filterNegatives xs))

-- renattinho --
somaSqrt2:: [Double] -> Double
somaSqrt2 lista = foldr (+) 0 listaSqrt
  where listaFiltrada = filter (>0) lista
        listaSqrt     = map sqrt listaFiltrada

-- belinha --
somaSqrt3 :: Floating a => Ord a => [a] -> a 
somaSqrt3 [] = 0
somaSqrt3 l = foldr (+) 0 (map sqrt (filter (>0) l))


