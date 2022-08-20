type Ponto = (Float, Float)

distPont :: Ponto -> Ponto -> Float
distPont p1 p2 = (sqrt( (((fst p2)-(fst p1))**2) + (((snd p2)-(snd p1))**2)))
