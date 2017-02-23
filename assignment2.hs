count :: [[a]] -> [Int]
count = map length

equal :: [Int] -> Bool
equal xs = and $ map (== head xs) (tail xs)

zero_exists :: [Int] -> Bool
zero_exists = all (==0)

is_matrix :: [[a]] -> Bool
is_matrix [] = False
is_matrix x = func x (count x)
	where
		func x y
			| 0 `elem` y = False
			| otherwise = equal (count x)

--is_matrix [[],[],[]] = False
--is_matrix [[2,3], [4,5], [6,7]] = True
--is_matrix [[2,3,4,5,6,7]] = True