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
