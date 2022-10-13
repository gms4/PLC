-- Crie uma thread "produtora" que disponibiliza números de 0 até um número qualquer X
-- E uma thread "consumidora" que printa esses números

import Control.Concurrent
import Text.Printf

main = do
    queue <- newMVar 0
    i <- newMVar 0
    print_control <- newMVar True

    forkIO $ produtora queue i 10000 print_control
    forkIO $ consumidora queue print_control

produtora :: MVar Int -> MVar Int -> Int -> MVar Bool -> IO()
produtora queue i x control = loop
    where
        loop = do
            n <- takeMVar  i
            if (n <= x) then
                do
                    putMVar queue n
                    ctrl <- takeMVar control
                    printf "Produtor produziu: %d\n" n
                    putMVar control ctrl
                    putMVar i (n+1)
                    loop
                else
                    return()

consumidora :: MVar Int -> MVar Bool -> IO()
consumidora queue control = loop
    where
        loop = do
            n <- takeMVar queue
            ctrl <- takeMVar control
            printf "Consumidor consumiu: %d\n" n
            putMVar control ctrl
            loop