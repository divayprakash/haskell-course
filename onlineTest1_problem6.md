# Online Test 1, Problem 6

Consider the following definition of a tree in Haskell.
```haskell
data Tree = Nil | Node Tree Int Tree
  deriving (Show,Read)
```

A *leaf* is a node with no children. Write a function `leaflist :: Tree -> [Int]` that prints out the values at the leaves of the tree as a list, from left to right.

**Sample Test Cases**

Test Case | Input	| Output
--------- | ----- | ------
Test Case 1	| `leaflist (Node Nil 7 Nil)` | `[7]`
Test Case 2	| `leaflist (Node (Node Nil 5 Nil) 8 (Node (Node Nil 6 Nil) 7 Nil))` | `[5,6]`
