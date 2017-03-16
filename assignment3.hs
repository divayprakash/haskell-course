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
nohundred x
    | x <= 0    = 0
    | otherwise = nohundred_list !! x
