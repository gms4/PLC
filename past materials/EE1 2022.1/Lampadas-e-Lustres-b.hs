-- belinha -- 
type Nome = String
type Potencia = Int

data Lampada = Compacta Nome Potencia | Incandescente Nome Potencia deriving (Read)

data Lustre = Pendente Lampada | Barra Lustre Lustre deriving (Read)

potencia :: Lustre -> Int
potencia (Pendente (Compacta nome potencia)) = potencia
potencia (Pendente (Incandescente nome potencia)) = potencia
potencia (Barra lus1 lus2) = potencia lus1 + potencia lus2