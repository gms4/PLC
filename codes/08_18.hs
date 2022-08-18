-- I/O --
-- Aqui só cai na segunda prova --

{-
Prelude> :t getLine
getLine :: IO String
Prelude> :t putStrLn
putStrLn :: String -> IO ()
-}

-- ghc 08_18.hs -o io

-- main = do imprimeStr
--           leituraEscrita

imprimeStr :: IO ()
imprimeStr = do putStrLn "asdf"
                putStrLn "ertyerty"

imprimeStr4vezes :: String -> IO()
imprimeStr4vezes str = do putStrLn str
                          putStrLn str
                          putStrLn str 
                          putStrLn str

{-
*Main> imprimeStr4vezes "hello"
hello
hello
hello
hello      
-}

imprimeStrNvezes :: Int -> String -> IO()
imprimeStrNvezes n str = 
        if n <= 1
        then putStrLn str
        else do putStrLn str
                imprimeStrNvezes (n-1) str

{-
*Main> imprimeStrNvezes 3 "hello"
hello
hello
hello
-}

leituraEscrita = do l1 <- getLine
                    l2 <- getLine
                    putStrLn l1
                    putStrLn l2
                    putStrLn "qwerty"

{-
*Main> leituraEscrita
hello 
hi
hello 
hi
qwerty       
-}

reverse2lines :: IO()
reverse2lines =
    do line1 <- getLine
       line2 <- getLine
       let l1 = reverse line1
       let l2 = reverse line2
       putStrLn l1
       putStrLn l2

{-
*Main> reverse2lines
hello
hey
olleh
yeh
-}

funcaoComReturn = 
        do return ()
           l1 <- return "Hello darkness my old friend"
           line <- getLine
           return "I've come to talk to you again"
           v <- return 4
           putStrLn l1
           putStrLn line
           putStrLn (show v)

{-
*Main> funcaoComReturn
hello hey humming
Hello darkness my old friend
hello hey humming
4
-}

funcaoComReturn2 =
    do a <- return "oi"
       b <- return "tchau"
       putStrLn $ a ++ " " ++ b

{-
*Main> funcaoComReturn2
oi tchau
-}

showStackHead []       = return []
showStackHead (x:xs)   =
    do putStrLn $ "resultado: " ++ [x]
       return xs

-- comentar main lá em cima pra rodar isso --
main :: IO()
main =
    do
        let s1 = []
        r1 <- showStackHead s1
        putStrLn $ "resultado " ++ r1

        putStrLn "----"

        let s2 = "asdf"
        r2 <- showStackHead s2
        putStrLn $ "resultado " ++ r2

        putStrLn "----"

        let s3 = "a"
        r3 <- showStackHead s3
        putStrLn $ "resultado " ++ r3