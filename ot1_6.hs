import System.IO

data Tree = Nil | Node Tree Int Tree
  deriving (Show,Read)

leaflist :: Tree -> [Int]
leaflist Nil = []
leaflist (Node Nil  node_data Nil)    = [node_data]
leaflist (Node left node_data Nil)    = leaflist left
leaflist (Node Nil  node_data right)  = leaflist right
leaflist (Node left node_data right ) = leaflist left ++ leaflist right
main = do {
    t <- readLn :: IO Tree;
    putStrLn . show $ leaflist t
}
