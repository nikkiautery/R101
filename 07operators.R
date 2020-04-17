## Operators, operands, results

## Arithmetic opreator: numerical values
## Logical operators: boolean or logical values

## Arithmetic Operators: + * / %% ^ or ** %/%

## R as a Calculator

a <- 10 + 5 ## Addition
b <- 10 - 5 ## Subtraction
c <- 10 * 5 ## Multiplication
d <- 10 / 5 ## Division
e <- 10 ^ 5 ## Exponentiation with ^
f <- 10 ** 5 ## Exponentiation with **
g <- format(10 ^ 5, scientific =  FALSE) ## Turns of Scientific Notation
h <- 10 %% 5 ## Modulus - Divide and return the remainder; in this case, 0...
i <- 10 %% 3 ## Modulus - Divide and return the remainder; in this case, 1...
j <- 10 %/% 5 ## Integer division will only return a whole number, not decimal
k <- 10 %/% 3 ## Integer division will only return a whole number, not decimal

## Note: TRUE and FALSE must be written in all caps

## Mathematical Functions:

abs(-5) ## Absolute
log(2) ## Natural Logarithm 
log(2, base = 10) ## Logarithm (?)
exp(5) ## Exponential 
factorial(5) ## Factorial

## Logarithm: a quantity representing the power to which a fixed number 
## (the base) must be raised to produce a given number.

## Natural Logarithm: The natural logarithm of a number is its logarithm to 
## the base of the mathematical constant e, where e is an irrational and 
## transcendental number approximately equal to 2.718281828459.

## Exponential: In mathematics, an exponential function is a function of the 
## form where b is a positive real number, and in which the argument x occurs 
## as an exponent.

## Factorial: A factorial is a function that multiplies a number by every 
## number below it. For example 5!= 5*4*3*2*1=120.

## Special Constants: 

pi ## Pi (3.141593)
options() ## Get global options; see how many digits after the decimal display
options(digits = 10) ## Set digits to 10 for PI (3.141592654)

Inf ## The result of dividing 1 by 0 and other special cases

## Special Numbers

Inf ## Positive Infinity representing overflow conditions or numbers too big
-Inf
NaN ## Not a Number; Not a real Number
NA ## Not Availabe, missing values

## The above is for overflow conditions or when mathematical conditions don't
## make any sense; also with missing data

## Infinity
1/0 ## Positive Inf 
-1/0 ## Negative Inf
Inf + 5 ## Operation on Inf
is.finite(1/0) ## Check if finite
is.infinite(1/0) ## Check if infinite (Inf)

## Undefined 
Inf/Inf ## NaN (Not a Number)
is.nan(Inf/Inf) ## Check if NaN

## Missing Values
NA + 5 ## Operation on NA
is.na(NA) ## Check if NA

## NaN is NA, but NA is not NaN
is.na(NaN) ## Check if NaN is NA
is.nan(NA) ## Check if NA is NaN

## Logical Operators

## > Greater Than
## >= Greater Than or Equal To
## < Less Than
## <= Less Than or Equal To
## == Equal To
## != Not Equal To
## ! Logical NOT
## | ("pipe, SHIFT and Backslash) Logical OR
## & Logical AND

5 > 2 ## 5 is greater than 2; TRUE
5 >= 2 ## 5 is greater than or equal to 2; TRUE
5 < 2 ## 5 is less than 2; FALSE
5 <= 2 ## 5 is less than or equal to 2; FALSE
5 == 2 ## 5 equals 2; FALSE
5 != 2 ## 5 is not equal to 2; TRUE
"b" > "a" ## b is greater than a (a through z also have numeric values); TRUE
!(TRUE) ## NOT TRUE = FALSE
TRUE | FALSE ## TRUE OR FALSE, if any operand evaluates to TRUE, it is TRUE
TRUE & FALSE ## TRUE AND FALSE, these both must be TRUE otherwise, result FALSE






























