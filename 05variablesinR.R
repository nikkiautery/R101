## Variables are placeholders for any objects
x <- 10 ## Assigning a variable
## Variable names are case sensitive 'x' is not 'X'
## Naming conventions letters, numbers, dots, underline chars; starts with 
## letter or .
empName <- "Employee Name"
emp_Name <- "Empoloyee Name"
.empName <- "Employee Name"

## Reserved key words cannot be used as variables.

## Google R Style Guide: http://bit.ly/googleRGuide tips:
    ## all lower case
    ## use.dot.to.separate.words
    ## do not use underscore "_" or hyphens "-"

student.marks <- "Student Marks"

## Assigning a variable: use <- 
x <- 10

## Assign()

assign(x, 10)

match.score <- 300 ## using assignment operator <-
match.score ## print the variable content
assign("match.score", 300) #using the assign() function 
match.score ## print the contents of match.score

