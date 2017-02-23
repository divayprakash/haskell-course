count :: [[a]] -> [Int]
count = map length

equal :: [Int] -> Bool
equal xs = and $ map (== head xs) (tail xs)

is_matrix :: [[a]] -> Bool
is_matrix x
	| x == [] = False
	| otherwise = func x (count x)
	where
		func x (count x)
			


--is_matrix [[],[],[]] = False
--is_matrix [[2,3], [4,5], [6,7]] = True
--is_matrix [[2,3,4,5,6,7]] = True