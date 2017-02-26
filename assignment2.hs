count :: [[a]] -> [Int]
count = map length

equal :: [Int] -> Bool
equal xs = and $ map (== head xs) (tail xs)

is_matrix_helper :: [[a]] -> [Int] -> Bool
is_matrix_helper x y
    | 0 `elem` y = False
    | otherwise  = equal (count x)

is_matrix :: [[a]] -> Bool
is_matrix [] = False
is_matrix x  = is_matrix_helper x (count x)

is_square_matrix :: [[a]] -> Bool
is_square_matrix x = (is_matrix x) && ((length x) == (length (x !! 0)))

addable :: [[Int]] -> [[Int]] -> Bool
addable x y = ((is_matrix x) && (is_matrix y) && (length x == length y) && ((length (x !! 0)) == (length (y !! 0))))

add_matrix :: [[Int]] -> [[Int]] -> [[Int]]
add_matrix x y
    | (addable x y) == True = zipWith (zipWith (+)) x y
    | otherwise             = []

multiplyable :: [[Int]] -> [[Int]] -> Bool
multiplyable x y
    | ((length (x !! 0)) == length y) = True
    | otherwise                       = False

transpose :: [[Int]] -> [[Int]]
transpose []     = repeat []
transpose (x:xs) = zipWith (:) x (transpose xs)

dotProduct :: [Int] -> [Int] -> Int
dotProduct x y = sum $ zipWith (*) x y

multiply_matrix :: [[Int]] -> [[Int]] -> [[Int]]
multiply_matrix x y
    | (multiplyable x y) == True = [[dotProduct xr yc | yc <- transpose y ] | xr <- x]
    | otherwise                  = []

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x:(merge xs (y:ys))
    | otherwise = y:(merge (x:xs) ys)

mergesort :: [Int] -> [Int]
mergesort []  = []
mergesort [x] = [x]
mergesort l = merge (mergesort (front l)) (mergesort (back l))
    where
        front l = take ((length l) `div` 2) l
        back l  = drop ((length l) `div` 2) l

remDup::[Int]->[Int]
remDup = remDupHelper []
    where
        remDupHelper seen [] = seen
        remDupHelper seen (x:xs)
            | x `elem` seen = remDupHelper seen xs
            | otherwise     = remDupHelper (seen ++ [x]) xs

cubes = map (^3) [1..]

ramanujan_helper n  = [(a + b)
            | a <- (take n cubes),
              b <- (filter (>a) (take n cubes)),
              c <- (filter (<b) (filter (>a) (take n cubes))),
              d <- (filter (<b) (filter (>a) (take n cubes))),
              (a + b) == (c + d)]

ramanujan :: Int -> Int
ramanujan n = ((mergesort (remDup (ramanujan_helper 30))) !! (n - 1))
