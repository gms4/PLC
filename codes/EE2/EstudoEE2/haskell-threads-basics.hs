-- Construa um programa onde N threads incrementam
-- contadores locais (não compartilhados) em um laço. Cada
-- thread imprime o valor de seu contador a cada incremento.
-- As threads param quando seus contadores chegam a um 
-- valor limite X, recebido como entrada pelo programa.

-- Agora mude seu programa para que as threads modifiquem 
-- um contador global compartilhado entre elas.

import Control.Concurrent
import Text.Printf

main = do
    i <- newMVar 0
    -- i1 <- newMVar 0
    -- i2 <- newMVar 0
    -- i3 <- newMVar 0
    -- i4 <- newMVar 0 

    forkIO $ contador "contador 1" i 1000
    forkIO $ contador "contador 2" i 1000
    forkIO $ contador "contador 3" i 1000
    forkIO $ contador "contador 4" i 1000

contador :: String -> MVar Int -> Int -> IO()
contador nome i x = loop
    where
        loop = do
            n <- takeMVar  i
            if (n <= x) then
                do
                    printf "%s: %d\n" nome n
                    putMVar i (n+1)
                    loop
                else
                    return()