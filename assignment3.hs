import Data.List

largestPower :: Int -> Int -> Int
largestPower n p = sum [floor (fromIntegral n / fromIntegral (p ^ i))
                            | i <- [1..n],
                              (p ^ i) < n]

binary :: Int -> Int
binary 0 = 0
binary x = 10 * (binary (x `div` 2)) + (x `mod` 2)

binary_list = [binary i | i <- [0,1..]]
nohundred_list = [i | i <- [0,1..], isInfixOf "100" (show (binary_list !! i)) == False]

nohundred :: Int -> Int
nohundred n
    | n <= 0    = 0
    | otherwise = nohundred_list !! n

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)

mergesort :: [Int] -> [Int]
mergesort []  = []
mergesort [x] = [x]
mergesort l   = merge (mergesort (front l)) (mergesort (back l))
    where
        front l = take ((length l) `div` 2) l
        back l  = drop ((length l) `div` 2) l

remDup::[Int]->[Int]
remDup = remDupHelper []
    where
        remDupHelper seen [] = seen
        remDupHelper seen (x:xs)
            | x `elem` seen = remDupHelper seen xs
            | otherwise     = remDupHelper (seen ++ [x]) xs

infListCreate :: Int -> Int -> [Int] -> [Int]
infListCreate n i list
 | n > i = (infListCreate n (i + 1) (mergesort (remDup (((list !! i) * 2) : ((list !! i) * 3) : ((list !! i) * 5) : list))))
 | otherwise = list

infListElem :: Int -> Int
infListElem n
    | n <= 0    = 0
    | n == 1    = 1
    | otherwise = (infListCreate n 0 [1]) !! (n - 1)

infList :: [Integer]
infList = [toInteger (infListElem i) | i <- [1..]]

priorTo :: String -> String -> Bool
priorTo s1 s2 = length s1 < length s2 || (length s1 == length s2 && s1 < s2)
