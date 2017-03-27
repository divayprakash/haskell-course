import System.IO
import System.Exit

main = do
    str <- getLine
    if (str /= "EOF")
        then do
            appendFile "temp" (str ++ "\n")
            main
        else do
            withFile "temp" ReadWriteMode (\handle -> do
                contents <- hGetContents handle
                let ls = lines contents
                printfunc ls (length ls))

printfunc :: [String] -> Int -> IO ()
printfunc lines length
    | length > 0  = printfunchelper lines length
    | length == 0 = exitSuccess

printfunchelper lines length = do
    writeFile "temp" ""
    putStrLn (reverse (lines!!(length - 1)))
    printfunc lines (length - 1)
