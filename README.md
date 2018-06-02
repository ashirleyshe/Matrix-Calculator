# Matrix-Calculator
### Problem description
Be similar to a simple calculator. In the problem, you’re asked to
write a syntax and sematic checker for a matrix expression compiler.
The objective of this problem contents two part. The first part is to
build a AST for the input expression. The second part is to check if the
dimension on both side of each operator is valid. For example of
multiplication:A1x2 * B2x1 is valid which will generate a matrix
with 1 x 1 dimension. But A2x3 * B2x4 is invalid. But if we take
transpose of A in expression: A2x3^T * B2x4 which equals to A3x2 * B2x4
the whole expression can be valid. The following
are supported operators in this compiler:  
`addition ‘+’`  
`subtraction ‘-’`  
`multiplication ‘*’`  
`transpose ‘^T’`  
`parenthesis ‘( )’`  
All matrix are 2-dimensional matrices which are
represented as [column number , row number] e.g. [2, 3] is a 2x3
matrix and [5,1] is a 5x1 matrix. Your output should show “Syntax
Error” if the input expression does not follow the grammar. If it
follows the grammar, then apply sematic check to see if the
dimension on both side of each operator is correct. Print “Sematic
error on col ” followed by the location of the first operator which
makes the sematic error occur in post order of AST. If no any syntax
error or sematic error, print “Accepted”.  
**Sample Input 1:**  
[2,1]^T *[2,1]  
**Sample Output1:**  
Accepted  
**Sample Input 2:**  
([2,3] * [2,3]^T)^T+[4,1]  
**Sample Output 2:**  
Semantic error on col 18   
**Sample Input 3:**  
([1,2]+[2,1]^T)*[1,3]*[1,3]^T*[3,3]  
**Sample Output 3:**  
Semantic error on col 16
