remDivLeft :: Int -> [a] -> [a]
remDivLeft idx list = remDivLeftHelper list (idx - 1) 0 [] where
    remDivLeftHelper list stopIndex currentIndex acc
        | currentIndex < stopIndex  = remDivLeftHelper (tail list) stopIndex (currentIndex + 1) (acc ++ [head list])
        | otherwise                 = acc

remDivRight :: Int -> [a] -> [a]
remDivRight idx list = remDivRightHelper list idx [] where
    remDivRightHelper list currentIndex acc
        | currentIndex < (length list)  = remDivRightHelper (tail list) currentIndex (acc ++ [list !! currentIndex])
        | otherwise                   = acc

remDiv :: Int -> [a] -> ([a], [a])
remDiv num list
    | num > length list       = (list, [])
    | num <  0                 = ([], list)
    | otherwise                = (remDivLeft num list, remDivRight num list)