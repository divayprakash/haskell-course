largestPower :: Int -> Int -> Int
largestPower n p = sum [floor (fromIntegral n / fromIntegral (p ^ i))
                            | i <- [1..n],
                              (p ^ i) < n]
