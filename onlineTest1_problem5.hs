import System.IO

ndigits ::  Integer -> Integer -> Integer
ndigits n b = ndigitshelper n b 1

ndigitshelper :: Integer -> Integer -> Integer -> Integer
ndigitshelper n b c
    | (b ^ c) < n  = ndigitshelper n b (c + 1)
    | (b ^ c) > n  = c
    | otherwise    = (c + 1)

main = do {
    (n,b) <- readLn :: IO (Integer,Integer);
    putStrLn . show $ ndigits n b
}
