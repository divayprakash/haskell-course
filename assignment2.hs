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

is_square_matrix :: [[a]] -> Bool
is_square_matrix x = (is_matrix x) && ((length x) == (length (x !! 0)))

addable :: [[Int]] -> [[Int]] -> Bool
addable x y = ((length x == length y) && ((length (x !! 0)) == (length (y !! 0))))

add_matrix :: [[Int]] -> [[Int]] -> [[Int]]
add_matrix x y
    | (addable x y) == True = zipWith (zipWith (+)) x y
    | otherwise = []

multiplyable :: [[Int]] -> [[Int]] -> Bool
multiplyable x y
    | ((length (x !! 0)) == length y) = True
    | otherwise = False

multiply :: Int -> Int -> Int
multiply x y = x * y

transpose :: [[a]] -> [[a]]
transpose [] = repeat []
transpose (m:ms) = zipWith (:) m (transpose ms)

multiply_matrix :: [[Int]] -> [[Int]] -> [[Int]]
multiply_matrix x y
    | (multiplyable x y) == True = [[sum $ zipWith (*) xr yc | yc <- (transpose y) ] | xr <- x]
    | otherwise = []
