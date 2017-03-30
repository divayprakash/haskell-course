import System.IO

repeated :: [String] -> Int
repeated x = repeated_helper x 0

repeated_helper :: [String] -> Int -> Int
repeated_helper [] c      = c
repeated_helper (x:xs) c
    | (count xs x 0) >= 1 = repeated_helper (remove x xs) (c + 1)
    | otherwise           = repeated_helper xs c

count :: [String] -> String -> Int -> Int
count [] y c    = c
count (x:xs) y c
    | (x == y)  = count xs y (c + 1)
    | otherwise = count xs y c

remove :: String -> [String] -> [String]
remove element list = filter (\e -> e /= element) list

main = do {
    ls <- readLn :: IO [String];
    putStrLn . show $ repeated ls
}
