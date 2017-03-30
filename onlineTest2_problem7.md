# Online Test 2, Problem 7

Write a standalone Haskell program that that can be compiled and run by `ghc` that reads input from the keyboard (standard input). The input will consist of some number of lines of text. The input will be terminated by a line containing `EOF`. Your program should print every third line.

**Sample Test Cases**

Test Case | Input |	Output
--------- | ----- | ------
Test Case 1	| "Spot the mistake<br>in the following argument",<br>Jack challenged<br>1+(-1+1)+(-1+1)+... = (1+ -1)+(1+ -1)+...<br>so therefore,<br>1 = 0<br>??<br>EOF | Jack challenged<br>1 = 0
Test Case 2	| Line 1<br>Line 2<br>Line 3<br>Line 4<br>Line 5<br>EOF | Line 3
