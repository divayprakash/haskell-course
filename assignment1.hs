repl::String->String
repl s = concatMap (replicate 2) s

remDup::[Int]->[Int]
remDup = remDupHelper []
    where
        remDupHelper seen [] = seen
        remDupHelper seen (x:xs)
            | x `elem` seen = remDupHelper seen xs
            | otherwise     = remDupHelper (seen ++ [x]) xs

remChamp::[Int]->[Int]
remChamp x = remChampHelper (maximum x) x
    where
        remChampHelper _ [] = []
        remChampHelper y (x:xs)
            | y == x    = xs
            | otherwise = x : remChampHelper y xs

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)

mergesort :: [Int] -> [Int]
mergesort [] = []
mergesort [x] = [x]
mergesort l = merge (mergesort (front l)) (mergesort (back l))
    where
        front l = take ((length l) `div` 2) l
        back l = drop ((length l) `div` 2) l

remRunnerUp::[Int]->[Int]
remRunnerUp x
    | (length x) <= 2 = x
    | otherwise       = remRunnerUpHelper ((mergesort x)!!(length x - 2)) x
    where
        remRunnerUpHelper _ [] = []
        remRunnerUpHelper y (x:xs)
            | y == x    = xs
            | otherwise = x : remRunnerUpHelper y xs
