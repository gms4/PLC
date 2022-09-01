-- belinha -- 
type Nome = String
type Potencia = Int

data Lampada = Compacta Nome Potencia | Incandescente Nome Potencia deriving (Read)

instance Show (Lampada) where
  show (Compacta n p) = "Compacta" ++ " " ++ n ++ " " ++ show (p)
  show (Incandescente n p) = "Incandescente" ++ " " ++ n ++ " " ++ show (p)