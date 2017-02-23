count :: [[a]] -> [Int]
count = map length

equal :: [Int] -> Bool
equal xs = and $ map (== head xs) (tail xs)

is_matrix_helper :: [[a]] -> [Int] -> Bool
is_matrix_helper x y
	| 0 `elem` y = False
	| otherwise = equal (count x)

is_matrix :: [[a]] -> Bool
is_matrix [] = False
is_matrix x = is_matrix_helper x (count x)
