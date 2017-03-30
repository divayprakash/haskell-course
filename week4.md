# Week 4 Programming Assignment

1. Define a function `repl :: String` -> String that repeats each letter twice. 

Examples:
```haskell
repl "abcde" = "aabbccddee"
repl " " = "  "
```

2. Define a function `remDup :: [Int] -> [Int]` that removes duplicates from a list of integers. That is, if any element of the list is repeated many times, only the first occurrence of the element should be retained and the others discarded.

Examples:
```haskell
remDup [1,1,2,2,3,3,4,4,4] = [1,2,3,4]
remDup [1,2,3,3,2] = [1,2,3]
```

3. Define a function `remChamp :: [Int] -> [Int]` that removes the first occurrence of the largest number in the input list and leaves the remaining list undisturbed. If the input list is empty, it should return the empty list.

Examples:
```haskell
remChamp [22, 35, 4, 65] = [22,35,4]
remChamp [1,5,2,3,5,4] = [1,2,3,5,4]
remChamp [5] = []
```

4. Define a function `remRunnerUp :: [Int] -> [Int]` that removes the second largest number in the input list and leaves the remaining list undisturbed. The second largest number is defined to be the
second number in the list if the list is sorted in descending order.  So, in particular, if the largest number appears twice, the second largest number is the same as the largest number.  If
the input list is has less than two elements, the function should return the input list unchanged.

Examples: 
```haskell
remRunnerUp [22, 35, 4, 65] = [22,4,65]
remRunnerUp [1,5,2,3,5,4] = [1,2,3,5,4]
remRunnerUp [5] = [5]
```

**Submission instructions:**
* Submit all four functions together as a single submission.
* Ignore the line `import System.IO` above the code window. This is needed for compiling your code on the server.


**Sample Test Cases**
Test Case | Input | Output
--------- | ----- | ------
Test Case 1 | repl "abcde" | "aabbccddee"
Test Case 2	| repl " " | "  "
Test Case 3	| remDup [1,1,2,2,3,3,4,4,4] | [1,2,3,4]
Test Case 4	| remDup [1,2,3,3,2] | [1,2,3]
Test Case 5	| remChamp [22, 35, 4, 65] | [22,35,4]
Test Case 6	| remChamp [1,5,2,3,5,4] | [1,2,3,5,4]
Test Case 7	| remChamp [5] | []
Test Case 8	| remRunnerUp [22, 35, 4, 65] | [22,4,65]
Test Case 9	| remRunnerUp [1,5,2,3,5,4] | [1,2,3,5,4]
Test Case 10 | remRunnerUp [5] | [5]
