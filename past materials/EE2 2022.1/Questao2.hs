-- Guilherme Macedo de Souza (gms4)

import Control.Concurrent
import Text.Printf

-- função que simula a máquina de refri
machine :: MVar Int -> Int -> String -> MVar Int -> MVar Bool -> IO ()
machine client_id client_count idRefri refri isAvailable
  = do occupied <- takeMVar isAvailable
       newClient <- takeMVar client_id
       if newClient <= client_count then 
        do  newRefri <- takeMVar refri
            threadDelay 1000000 -- tempo que demora para encher um copo
            putMVar refri (newRefri - 300) -- reduzindo do volume total o volume do copo tirado
            printf "O cliente %d do refrigerante %s está enchendo seu copo!\n" newClient idRefri
            putMVar isAvailable occupied
            putMVar client_id (newClient + 1)
            machine client_id client_count idRefri refri isAvailable
         else do putMVar isAvailable occupied
                 putMVar client_id newClient

-- função que simula o refill da máquina
refill :: String -> MVar Int -> MVar Bool -> IO ()
refill idRefri refri isAvailable
  = do occupied <- takeMVar isAvailable
       newRefri <- takeMVar refri
       if newRefri < 1000 then -- condição de necessidade do refill
        do  threadDelay 1500000 -- tempo que demora pra fazer o refill
            putMVar refri (newRefri + 1000) -- refill feito e volume atualizado
            newRefri <- takeMVar refri
            printf "Pausa para abastecer!\n"
            printf "O refrigerante %s foi reabastecido com 1000 ml, e agora possui %d ml!\n" idRefri newRefri
            putMVar refri newRefri
         else do putMVar refri newRefri
       putMVar isAvailable occupied
       refill idRefri refri isAvailable

main :: IO ()
main 
  = do pCola      <- newMVar 2000
       gPolo      <- newMVar 2000
       gQuate     <- newMVar 2000
       
       client_id <- newMVar 1

       -- Pensei em fazer sem uma quantidade de clientes pra simular melhor a realidade
       -- Mas ia ficar rodando infinitamente, então fiz assim mesmo
       let client_count = 30

       isAvailable <- newMVar True

       forkIO (machine client_id client_count "P-Cola" pCola isAvailable)
       forkIO (refill "P-Cola" pCola isAvailable)
       
       forkIO (machine client_id client_count "Guaraná Polo Norte" gPolo isAvailable)
       forkIO (refill "Guaraná Polo Norte" gPolo isAvailable)

       forkIO (machine client_id client_count "Guaraná Quate" gQuate isAvailable)
       forkIO (refill "Guaraná Quate" gQuate isAvailable)
       
       return ()
          
          