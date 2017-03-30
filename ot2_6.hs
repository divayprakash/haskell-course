import System.IO

data Tree = Nil | Node Tree Int Tree
  deriving (Show,Read)

leafcount :: Tree -> Int
leafcount x = leafcount_helper x 0

leafcount_helper :: Tree -> Int -> Int
leafcount_helper (Node Nil n Nil)  a   = (a + 1)
leafcount_helper (Node left n Nil) a   = leafcount_helper left a
leafcount_helper (Node Nil n right) a  = leafcount_helper right a
leafcount_helper (Node left n right) a = (leafcount_helper left a) + (leafcount_helper right a)

main = do {
    t <- readLn :: IO Tree;
    putStrLn . show $ leafcount t
}
