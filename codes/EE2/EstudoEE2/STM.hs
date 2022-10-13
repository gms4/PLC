-- Construa um programa onde N threads incrementam
-- contadores locais (não compartilhados) em um laço. Cada
-- thread imprime o valor de seu contador a cada incremento.
-- As threads param quando seus contadores chegam a um 
-- valor limite X, recebido como entrada pelo programa.

-- Agora mude seu programa para que as threads modifiquem 
-- um contador global compartilhado entre elas.

import Control.Concurrent
import Control.Concurrent.STM
import Text.Printf

main = do
    i <- atomically (newTVar 0)
    ctrl <- newMVar True

    forkIO $ contador "contador 1" i 1000 ctrl
    forkIO $ contador "contador 2" i 1000 ctrl
    forkIO $ contador "contador 3" i 1000 ctrl
    forkIO $ contador "contador 4" i 1000 ctrl

contador :: String -> TVar Int -> Int -> MVar Bool -> IO()
contador nome i x ctrl = loop
    where
        loop = do
            n <- atomically (readTVar  i)
            if (n <= x) then
                do
                    c <- takeMVar ctrl
                    printf "%s: %d\n" nome n
                    putMVar ctrl c
                    atomically (writeTVar i (n+1))
                    loop
                else
                    return()