# Online Test 2, Problem 5

A positive integer n is a sum of squares if `n = i^2 + j^2` for integers `i`,`j` such that `i ≥ 1` and `j ≥ 1`. For instance, 10 is a sum of squares because `10 = 1^2 + 3^2`, and so is `25 = 3^2 + 4^2`. On the other hand, 11 and 3 are not sums of squares.

Write a Haskell function `sumofsquares :: Int -> Bool` that takes a positive integer argument and returns `True` if the integer is a sum of squares, and `False` otherwise.

**Sample Test Cases**

Test Case | Input	| Output
--------- | ----- | ------
Test Case 1	| `sumofsquares 10` | `True`
Test Case 2	| `sumofsquares 3` | `False`
