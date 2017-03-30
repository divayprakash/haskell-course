import System.IO

maxcount :: [String] -> Int
maxcount x = maxcount_helper x 0

count :: [String] -> String -> Int -> Int
count [] y c    = c
count (x:xs) y c
    | (x == y)  = count xs y (c + 1)
    | otherwise = count xs y c

maxcount_helper :: [String] -> Int -> Int
maxcount_helper [] max         = max
maxcount_helper (x:xs) max
    | (count (x:xs) x 0) > max = maxcount_helper xs (count (x:xs) x 0)
    | otherwise                = maxcount_helper xs max

main = do {
    ls <- readLn :: IO [String];
    putStrLn . show $ maxcount ls
}
