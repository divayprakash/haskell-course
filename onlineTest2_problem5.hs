import System.IO

sumofsquares ::  Int -> Bool
sumofsquares 0 = False
sumofsquares x = if length (triangles x) > 0 then True else False

triangles :: Int -> [(Int, Int, Int)]
triangles x = [(a,b,x) | c <-[x] , b <- [1..c], a <- [1..b] , a^2 + b^2 == c]
main = do {
    n <- readLn :: IO Int;
    putStrLn . show $ sumofsquares n
}
