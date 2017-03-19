import System.Exit

main :: IO ()
main = do
    str <- getLine
    if (str /= "EOF")
        then do
            putStrLn (reverse str)
            main
        else exitSuccess
