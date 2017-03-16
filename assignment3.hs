---------------------------------------------------------------------------------------------------
-----------------------------------------------Import----------------------------------------------
---------------------------------------------------------------------------------------------------

import Data.List

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 1----------------------------------------------
---------------------------------------------------------------------------------------------------

largestPower :: Int -> Int -> Int
largestPower n p = sum [floor (fromIntegral n / fromIntegral (p ^ i)) | i <- [1..n], (p ^ i) < n]

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 2----------------------------------------------
---------------------------------------------------------------------------------------------------

binary :: Int -> Int
binary 0 = 0
binary x = 10 * (binary (x `div` 2)) + (x `mod` 2)

binary_list = [binary i | i <- [0,1..]]
nohundred_list = [i | i <- [0,1..], isInfixOf "100" (show (binary_list !! i)) == False]

nohundred :: Int -> Int
nohundred n
    | n <= 0    = 0
    | otherwise = nohundred_list !! n

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 3----------------------------------------------
---------------------------------------------------------------------------------------------------

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x : (merge xs (y : ys))
    | otherwise = y : (merge (x : xs) ys)

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

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 4----------------------------------------------
---------------------------------------------------------------------------------------------------

priorTo :: String -> String -> Bool
priorTo s1 s2 = length s1 < length s2 || (length s1 == length s2 && s1 < s2)

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 5----------------------------------------------
---------------------------------------------------------------------------------------------------

sumDigits :: Int->Int
sumDigits n
    | n == 0    = 0
    | otherwise = (n `mod` 10) + (sumDigits (n `div` 10))

sumDigitsCheck :: Int -> [Int] -> Int
sumDigitsCheck n (x : xs)
    | n >= (sumDigits x) = (sumDigitsCheck n xs)
    | otherwise          = x

minus (x : xs) (y : ys)
    | x < y  = x : minus xs (y : ys)
    | x == y = minus xs ys 
    | x > y  = minus (x : xs) ys
minus xs _   = xs

primes :: [Int]
primes = sieve [2..]
    where
        sieve []     = []
        sieve (p:xs) = p : sieve (xs `minus` [p * p, p * p + p..])

goodPrime :: Int -> Int
goodPrime n = sumDigitsCheck n primes

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 6----------------------------------------------
---------------------------------------------------------------------------------------------------

getDigitsList :: Integer -> [Integer]
getDigitsList x
    | x == 0    = []
    | otherwise = getDigitsList (x `div` 10) ++ [x `mod` 10]

lookAndSay :: Integer -> Integer
lookAndSay n = read (concatMap describe (group (show n)))
    where
        describe run = show (length run) ++ take 1 run

lookAndSayList = iterate lookAndSay 1

stringLookAndSay :: Int -> String
stringLookAndSay n = show (fromInteger (lookAndSayList !! n))

getDigitsListHelper :: Int -> Int -> Integer
getDigitsListHelper n m = ((getDigitsList (lookAndSayList !! n)) !! m)

las :: Int -> Integer
las n
    | n < 0 = 0
    | length (stringLookAndSay n) >= 4 = 
          ((getDigitsListHelper n 0) * 1000)
        + ((getDigitsListHelper n 1) * 100)
        + ((getDigitsListHelper n 2) * 10)
        + ((getDigitsListHelper n 3) * 1)
    | length (show (fromInteger (lookAndSayList !! n))) == 3 = 
          ((getDigitsListHelper n 0) * 100)
        + ((getDigitsListHelper n 1) * 10)
        + ((getDigitsListHelper n 2) * 1)
    | length (show (fromInteger (lookAndSayList !! n))) == 2 = 
          ((getDigitsListHelper n 0) * 10)
        + ((getDigitsListHelper n 1) * 1)
    | length (show (fromInteger (lookAndSayList !! n))) == 1 = 
          ((getDigitsListHelper n 0) * 1)
