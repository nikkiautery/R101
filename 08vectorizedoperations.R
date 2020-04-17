## Vectorized Operations
## Vectors are "objects" in R; one dimensional set of values of similar type
## Combining discrete values = vector
## Involve operations or functions which can work on one or more vectors to 
## produce a result.
## Most functions in R are vectorized in nature
## Scalar means "single value"
## A vectorized operation might employ a function where it might work on diff-
## erent elements of a vector, producing a Scalar result.
## Length of vector is defined by how many elements are within it.
## A scalar result is considered a Vector of Length 1
## A vector result is considered a Vector of Length X where X is how many elem-
## -ents are in the result/vector
## A vectorized operation might employ a function or operation where it might
## work on different elements and produce a Vector result vs. a Scalar result.
## A vectorized operation might employ a function or operation where it might 
## work on multiple vectors (rather than elements) and produce a vector result.

## Types of vectorized operations:

## Note: E = "element", V = "vector"

## Example 1: Producing a Scalar Result
## V = {E1, E2, E3}
## mean(V)
## Result: E = (E1 + E2 + E3)/3

## Example 2: Producing a Vector Result
## V = {E1, E2, E3}
## sqrt(V) ...sqrt() is a "square root" function
## Result: {sqrt(E1), sqrt(E2), sqrt(E3)} -- contains a result for each element

## Example 3: Creating Vectorized Results from Vectors
## V1 + v2 + V3
## Each Vector contains 3 Elements;
## V1 = {E11, E12, E13}, V2 = {E21, E22, E23}, V3 = {E31, E32, E33}
## Each vector is a Length of 3, the Result will also be a Length of 3.
## V = { (E11 + E12 + E13),
##       (E21 + E22 + E23),
##       (E31 + E32 + E33) }
## The sum of all first elements of each vector, second, and third...
## V1 + v2 + v3 = Single Vector

## Demonstrations:

student.marks <- c(10, 20, 30, 40) ## c() = concatenate or "combine" function
student.marks ## print variable contents

## Vector Op. Type 1: Input Single vector (as multiple elements), Output Scalar
mean(student.marks)

## Vector Op. Type 2: Input Single Vector, Output Single Vector
student.marks <- student.marks + 5 ## Arithmetic Operator
student.marks
student.marks >= 30 ## Logical Operator

## Vector Op. Type 3: Input Multiple Vectors, Output Single Vector
student.physics.marks <- c(20, 40, 30, 50)
student.chemistry.marks <- c(30, 20, 50, 20)
student.total.marks <- student.physics.marks + student.chemistry.marks ## Add
student.total.marks

## RESULTS:

## student.marks <- c(10, 20, 30, 40) ## c() = concatenate or "combine" function
## student.marks ## print variable contents
## [1] 10 20 30 40

## Vector Op. Type 1: Input Single vector (as multiple elements), Output Scalar
## > mean(student.marks)
## [1] 25

## Vector Op. Type 2: Input Single Vector, Output Single Vector
## > student.marks <- student.marks + 5 ## Add "extra credit"
## > student.marks
## [1] 15 25 35 45

## > student.marks >= 30 ## Logical Operator; "30" is "Passing" Grade
## [1] FALSE FALSE  TRUE  TRUE 

## Vector Op. Type 3: Input Multiple Vectors, Output Single Vector
## > student.physics.marks <- c(20, 40, 30, 50)
## > student.chemistry.marks <- c(30, 20, 50, 20)
## > student.total.marks <- student.physics.marks + student.chemistry.marks 
## > student.total.marks
## [1] 50 60 80 70

## Type 3 adds each element in each vector to the corresponding element within
## the vector.
