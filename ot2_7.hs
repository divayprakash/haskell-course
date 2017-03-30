import System.Exit

main = do
    line1 <- getLine
    if (line1 /= "EOF")
    then do
        line2 <- getLine
        if (line2 /= "EOF")
        then do
            line3 <- getLine
            if (line3 /= "EOF")
            then putStrLn(line3)
            else exitSuccess
        else exitSuccess
    else exitSuccess
    main
