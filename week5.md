# Week 5 Programming Assignment

1. G H Hardy recounted the following anectode about Srinivasa Ramanujan..
I remember once going to see him when he was ill at Putney. I had ridden in taxi cab number 1729 and remarked that the number seemed to me rather a dull one, and that I hoped it was not an unfavorable omen. "No," he replied, "it is a very interesting number; it is the smallest number expressible as the sum of two cubes in two different ways."
Define a Ramanujan number to be a positive integer that can be expressed as a sum of two cubes in at least two different ways. The anecdote above says that 1729 is the smallest Ramanujan number: (1729 = 1<sup>3</sup> + 12<sup>3</sup> = 9<sup>3</sup> + 10<sup>3</sup>).

Define a function `ramanujan :: Int -> Int` such that `ramanujan n` is the nth smallest positive number that can be expressed  as a sum of two cubes in at least two different ways.

Examples:
```haskell
ramanujan 1 = 1729
ramanujan 4 = 20683
```

2.  A two-dimensional matrix can be represented as a list of rows, each row itself being a list of elements. So in general it is of type `[[a]]`. Not every list of lists is a matrix, though. For instance, `[[1,2,3], [], [2,4]]` is a list of three lists, each of a different size.

(a) Define a function `is_matrix :: [[a]] -> Bool` that checks if a list of lists is a valid matrix (nonzero number of rows, each of the same nonzero length).

Examples:
```haskell
is_matrix [] = False
is_matrix [[],[],[]] = False
is_matrix [[2,3], [4,5], [6,7]] = True
is_matrix [[2,3,4,5,6,7]] = True
```

(b) A square matrix is one where the number of rows is equal to the number of columns. Define a function `is_square_matrix :: [[a]] -> Bool` that checks if a list of lists is a square matrix.

Examples:
```haskell
is_square_matrix [] = False
is_square_matrix [[],[],[]] = False
is_square_matrix [[1]] = True
is_square_matrix [[1,2,3], [4,5,6], [7,8,9]] = True
```

(c) Given two integer matrices m1 and m2, they can be added if the number of rows and number of columns are the same. Define a function `addable :: [[Int]] -> [[Int]] -> Bool` that checks if two matrices are addable.

Examples:
```haskell
addable [[1,2],[3,4]] [[1,2,3],[4,5,6]] = False
addable [[1,2],[3,4]] [[5,6],[7,8]] = True
```

(d) Define a function that adds two matrices if they are addable (and returns the empty list if they are not addable). `add_matrix :: [[Int]] -> [[Int]] -> [[Int]]`

Examples:
```haskell
add_matrix [[1,2,3,4]] [[5,6,7,8]] = [[6,8,10,12]]
add_matrix [[1,2],[3,4]] [[5,6],[7,8]] = [[6,8],[10,12]]
```

(e) Given two integer matrices m1 and m2, they can be multiplied if the number of columns in m1 is the same as the number of rows in m2. Define a function `multiplyable :: [[Int]] -> [[Int]] -> Bool` that checks if two matrices are multiplyable.

Examples:
```haskell
multiplyable [[1,2,3],[4,5,6]] [[1,2],[3,4]] = False
multiplyable [[1,2],[3,4]] [[1,2,3],[4,5,6]] = True
```

(f) Define a function that mulitplies two matrices if they are multiplyable (and returns the empty list if they are not multiplyable). `multiply_matrix :: [[Int]] -> [[Int]] -> [[Int]]`

Examples:
```haskell
multiply_matrix [[1,2],[3,4]] [[1,2,3],[4,5,6]] = [[9,12,15],[19,26,33]]
multiply_matrix [[1,2,3],[4,5,6]] [[1,2],[3,4],[5,6]] = [[22,28],[49,64]]
```

**Submission instructions:**
* Submit all seven functions together as a single submission.
* Ignore the line `import System.IO` above the code window. This is needed for compiling your code on the server.

**Sample Test Cases**

Test Case | Input	| Output
--------- | ----- | ------
Test Case 1	| `ramanujan 1` | `1729`
Test Case 2	| `ramanujan 4` | `20683`
Test Case 3	| `is_matrix [[],[],[]]` | `False`
Test Case 4	| `is_matrix [[2,3], [4,5], [6,7]]` | `True`
Test Case 5	| `is_square_matrix []` | `False`
Test Case 6	| `is_square_matrix [[1,2,3], [4,5,6], [7,8,9]]` | `True`
Test Case 7	| `addable [[1,2],[3,4]] [[1,2,3],[4,5,6]]` | `False`
Test Case 8	| `addable [[1,2],[3,4]] [[5,6],[7,8]]` | `True`
Test Case 9	| `add_matrix [[1,2,3,4]] [[5,6,7,8]]` | `[[6,8,10,12]]`
Test Case 10 | `add_matrix [[1,2],[3,4]] [[5,6],[7,8]]` | `[[6,8],[10,12]]`
Test Case 11 | `multiplyable [[1,2,3],[4,5,6]] [[1,2],[3,4]]` | `False`
Test Case 12 | `multiplyable [[1,2],[3,4]] [[1,2,3],[4,5,6]]` | `True`
Test Case 13 | `multiply_matrix [[1,2],[3,4]] [[1,2,3],[4,5,6]]` | `[[9,12,15],[19,26,33]]`
Test Case 14 | `multiply_matrix [[1,2,3],[4,5,6]] [[1,2],[3,4],[5,6]]` | `[[22,28],[49,64]]`
