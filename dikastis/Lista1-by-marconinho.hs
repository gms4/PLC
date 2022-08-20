import Distribution.Simple.Program.HcPkg (list)
---- A ---- A ---- A ---- A ---- A ---- A ---- A ----


---- B ---- B ---- B ---- B ---- B ---- B ---- B ----
numDiv :: Integral a => a -> a -> a
numDiv dividendo divisor = numDivHelper dividendo divisor 0 where
    numDivHelper dvdn dvsr acc
        | dvdn >= dvsr && dvdn `mod` dvsr == 0            = numDivHelper (dvdn `div` dvsr) dvsr (acc + 1)
        | otherwise                                         = acc

---- C ---- C ---- C ---- C ---- C ---- C ---- C ----
pop :: [Int] -> Int -> [Int]
pop [] _ = []
pop (x:xs) el
    | x == el        = xs
    | otherwise      = x : pop xs el

isUnique :: [Int] -> Int -> Bool
isUnique list element = isUniqueHelper list element True where
    isUniqueHelper li el res
        | not res                              = False
        | res && not (null li)           = if el == (head li) then isUniqueHelper (tail li) el False else isUniqueHelper (tail li) el True
        | res && null li           = res

unicos :: [Int] -> [Int]
unicos lst = unicosHelper lst (-2) [] where
    unicosHelper lst idx acc
        | idx == -2                      = unicosHelper lst 0 acc
        | idx < length lst             = if isUnique (pop lst (lst !! idx)) (lst !! idx)
                                             then unicosHelper  lst (idx + 1) (acc ++ [lst !! idx])
                                             else unicosHelper  lst (idx + 1)  acc
        | otherwise                      = acc

---- D ---- D ---- D ---- D ---- D ---- D ---- D ----
remDivLeft :: Int -> [a] -> [a]
remDivLeft idx list = remDivLeftHelper list (idx - 1) 0 [] where
    remDivLeftHelper list stopIndex currentIndex acc
        | currentIndex < stopIndex  = remDivLeftHelper (tail list) stopIndex (currentIndex + 1) (acc ++ [head list])
        | otherwise                 = acc

remDivRight :: Int -> [a] -> [a]
remDivRight idx list = remDivRightHelper list idx [] where
    remDivRightHelper list currentIndex acc
        | currentIndex < length list  = remDivRightHelper (tail list) currentIndex (acc ++ [list !! currentIndex])
        | otherwise                   = acc

remDiv :: Int -> [a] -> ([a], [a])
remDiv num list
    | num > length list       = (list, [])
    | num <  0                 = ([], list)
    | otherwise                = (remDivLeft num list, remDivRight num list)

---- E ---- E ---- E ---- E ---- E ---- E ---- E ----
merge :: Ord a => [a] -> [a] -> [a]
merge l1 []                   = l1
merge [] l2                   = l2
merge l1 l2
    | head l1 <= head l2      = head l1 : merge (tail l1) l2
    | otherwise               = head l2 : merge l1 (tail l2)

---- F ---- F ---- F ---- F ---- F ---- F ---- F ----
-- collectEvens :: [a] -> [a]
-- collectEvens list = collectEvensHelper list 0 [] where
--     collectEvensHelper list index acc
--         | index < (length list - 1)         = collectEvensHelper list (index + 2) (acc : list!!index)
--         | otherwise                         = acc

-- collectOdds  :: [a] -> [a]
-- collectOdds list = collectOddsHelper list 1 [] where
--     collectOddsHelper list index acc
--         | index < (length list - 1)         = collectOddsHelper list (index + 2) (acc : list!!index)
--         | otherwise                         = acc

-- collect :: Bool -> [a] -> [a]
-- collect evens li = collectAux 0 [] li where
--     collectAux idx acc list
--         | idx < (length list - 1)     = collectAux (idx + 2) (acc : [list!!idx]) list
--         | otherwise                  = acc

collectElements :: Bool -> [b] -> [b]
collectElements evens list = collectElementsHelper list (if evens then 0 else 1) [] where
    collectElementsHelper list index acc
        | index <= (length list - 1)                        = collectElementsHelper list (index + 2) (acc ++ [list!!index])
        | otherwise                                         = acc

metade :: [a] -> ([a], [a])
metade list = (collectElements True list, collectElements False list)