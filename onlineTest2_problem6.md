# Online Test 2, Problem 6

Consider the following definition of a tree in Haskell.
```haskell
data Tree = Nil | Node Tree Int Tree
  deriving (Show,Read)
```
A leaf is a node with no children. Write a function `leafcount :: Tree -> Int` that prints out the number of leaves in the input tree.

**Sample Test Cases**

Test Case | Input	| Output
--------- | ----- | ------
Test Case 1	| `leafcount (Node Nil 7 Nil)` | `1`
Test Case 2	| `leafcount (Node (Node Nil 5 Nil) 8 (Node (Node Nil 6 Nil) 7 Nil))` | `2`
