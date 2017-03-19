---------------------------------------------------------------------------------------------------
-----------------------------------------------Import----------------------------------------------
---------------------------------------------------------------------------------------------------

import Data.List

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 1----------------------------------------------
---------------------------------------------------------------------------------------------------

largestPower :: Int -> Int -> Int
largestPower n p = (largestPowerHelper n p (0 - n))

largestPowerHelper :: Int -> Int -> Int -> Int
largestPowerHelper n p count
    | n > 0     = (largestPowerHelper (n `div` p) p (count + n))
    | otherwise = count

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 2----------------------------------------------
---------------------------------------------------------------------------------------------------

binary :: Int -> [Int]
binary 0 = [0]
binary x = binary (x `div` 2) ++ [x `mod` 2]

nohundred_list = [i | i <- [1,2..], (([1,0,0] `isInfixOf` (binary i)) == False)]

nohundred :: Int -> Int
nohundred n
    | n <= 0    = 0
    | otherwise = nohundred_list !! (n - 1)

---------------------------------------------------------------------------------------------------
-----------------------------------------------Part 3----------------------------------------------
---------------------------------------------------------------------------------------------------

remDup::[Int]->[Int]
remDup = remDupHelper []
    where
        remDupHelper seen [] = seen
        remDupHelper seen (x:xs)
            | x `elem` seen = remDupHelper seen xs
            | otherwise     = remDupHelper (seen ++ [x]) xs

infListCreate :: Int -> Int -> [Int] -> [Int]
infListCreate n i list
    | n > i = (infListCreate n (i + 1) (sort (remDup (((list !! i) * 2) : ((list !! i) * 3) : ((list !! i) * 5) : list))))
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

abundant :: Int -> String
abundant 1  = "abab"
abundant 2  = "aabab"
abundant 5  = "ababb"
abundant 10 = "aababa"

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
