## Functions in R are helpful for abstraction
## Built-in functions or custom functions.
## Input > Function > Output

## Creating a function: using function() function
## Create the function name: GetTotalMarks
## Create a function "example": function(quiz.marks, viva.marks)
## Create the body of the function between {} to be executed when the function
## is called; 
## { 
##   total.marks <- quiz.marks + viva.marks ## Creating "example" variables
##   total.marks
## }

GetTotalMarks <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    total.marks
}

student.physics.quiz.marks <- c(70L, 75L, 80L, 85L)
student.physics.viva.marks <- c(7L, 5L, 8L, 6L)
student.physics.total.marks <- GetTotalMarks(student.physics.quiz.marks, 
                                             student.physics.viva.marks)

student.physics.total.marks
## Results: [1] 77 80 88 91

student.chemistry.quiz.marks <- c(60L, 70L, 85L, 70L)
student.chemistry.viva.marks <- c(8L, 4L, 7L, 8L)
student.chemistry.total.marks <- GetTotalMarks(student.chemistry.quiz.marks,
                                               student.chemistry.viva.marks)
student.chemistry.total.marks
## Results: [1] 68 74 92 78

## Function components:
 
## GetTotalMarks <- Function(quiz.marks, viva.marks) {
##    total.marks <- quiz.marks + viva.marks
##    total.marks
## }

## Function.Name <- function(argument1, argument2) {
##    function.body <- function.logic1 + function.logic2
##    function.body ## Return Value; Implicit "Print"
## }

uas.mgtow <- function(airframe, payload) {
    mgtow <- airframe + payload
    mgtow
}

small.uas.airframe <- c(4.5, 6, 3.2, 7)
small.uas.payload <- c(1.2, 4, 2.8, 2)

small.uas.mgtow <- uas.mgtow(small.uas.airframe, small.uas.payload)
small.uas.mgtow

## Function Naming Convention Guidelines:
## Google R Style Guide: Initial Capital Letters, No Dots or Underscores
## GoogleNamingConvention is considered "good" by Google R Style Guide
## "Pascal Casing"


## Argument Matching/Mapping
## Used when there are multiple arguments in the function

## MyFunction(v1, v2)
## MyFunction <- function(x, y){
##    body
## }

## Passed from function invocation to function to arguments of the function
## definition: i.e. x = v1, y = v2

## Match by Position:

GetTotalMarks <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    total.marks
}

GetTotalMarks(c(70L, 75L, 80L, 85L), c(7L, 5L, 8L, 6L))
## The vector and its elements will be matched with its position; 
## quiz.marks = c(70L, 75L, 80L, 85L) & viva.marks = c(7L, 5L, 8L, 6L)


## Match by Name:

GetTotalMarks <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    total.marks
}

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), 
              viva.marks = c(7L, 5L, 8L, 6L))
## Results: [1] 77 80 88 91

## Using names means you can reorder the values in the function call; example:

GetTotalMarks(viva.marks = c(7L, 5L, 8L, 6L),
              quiz.marks = c(70L, 75L, 80L, 85L))
## Results: [1] 77 80 88 91

## Arguments with Default Values:
## Also known as Default Argument
## An argument which is not required to have values listed unless the user 
## wants to change/update the values for a specific use/call.

## In the example below, a teacher gives the default of 5 for Assignment Marks
## when assignments are submitted on time. If assignments are not submitted on
## time, the teacher will override the marks awarded for the submissions.



GetTotalMarks <- function(quiz.marks, viva.marks, assignment.marks = 5L) {
    total.marks <- quiz.marks + viva.marks + assignment.marks
    total.marks
}

## If all assignments are turned in on time, the following can be used:
## You do not have to call assignment.marks as it is a default 
## in GetTotalMarks

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),  
              viva.marks = c(7L, 5L, 8L, 6L))

## Results: [1] 82 85 93 96

## If assignments are turned in on time, the following can be used:
## You have to call assignment.marks to override the values in GetTotalMarks

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),  
              viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L))

## Results: [1] 79 81 91 95


## Additional Arguments Using Ellipses "..."
## A special argument which means "anything else"

## You have two known arguments, but you know you want to use a third argument(S),
## and you aren't sure what that/those argument(s) is/are.
## ... cannot be mapped using position or name.

GetTotalMarks <- function(quiz.marks, viva.marks, assignment.marks = 5L, ...){
    total.marks <- quiz.marks + viva.marks + assignment.marks + sum(...)
    ## sum(...) "add the sum of all extra arguments added"
    extra.arguments <- list(...) ## if you want to work on or see the 
    ## addtional arguments explicitly; list(...)
    print(extra.arguments)
    total.marks
}

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),  
              viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L),
              creativity.marks = 2)
## Results: [1] 81 83 93 97

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L),  
              viva.marks = c(7L, 5L, 8L, 6L),
              assignment.marks = c(2L, 1L, 3L, 4L),
              creativity.marks = 2, 
              attendance.marks = 3)
## Results: [1]  84  86  96 100


## Lazy Evaluation
## Evaluation of an expresssion is deferred until it is used for the first time
## Common in functional programming lanugages


GetTotalMarks <- function(quiz.marks, viva.marks, extra.marks = 
                              average.viva.marks){
    average.viva.marks <- mean(viva.marks)
    total.marks <- quiz.marks + viva.marks + extra.marks
    total.marks
}

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L))
## Results: [1] 83.5 86.5 94.5 97.5

## Multiple Return Values
## To return multiple values by using a list with a return statement

GetMarkSummary <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    avg.marks <- mean(total.marks)
    return(list(total = total.marks, average = avg.marks)) ## Creating a named list
}

GetMarkSummary(quiz.marks = c(70L, 75L, 80L, 85L), 
               viva.marks = c(7L, 5L, 8L, 6L))

## Results:
## $total
## [1] 77 80 88 91

## $average
## [1] 84

## Functions as Objects:
## Functions are first class objects
   ## Can look into them
   ## Assign them 
   ## Can pass them as arguments to other functions

GetTotalMarks <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    total.marks
}

## 01. Look into them:

GetTotalMarks ## Return the function itself
formals(GetTotalMarks) ## Access Arguments
body(GetTotalMarks) ## Access Body

## Results:

## GetTotalMarks ## Return the function itself
## function(quiz.marks, viva.marks){
##    total.marks <- quiz.marks + viva.marks
##    total.marks
## }

## formals(GetTotalMarks) ## Access Arguments
## $quiz.marks
## $viva.marks

## body(GetTotalMarks) ## Access Body
## {
##    total.marks <- quiz.marks + viva.marks
##    total.marks
## }


## 02. Assign them:

MyGetTotalMarks <- GetTotalMarks
MyGetTotalMarks

## Results:

## function(quiz.marks, viva.marks){
## total.marks <- quiz.marks + viva.marks
## total.marks
## }

## 03. Use them as arguments in another function:

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L))
## Results: [1] 77 80 88 91

## Pass the function as argument in the do.call() function
do.call(GetTotalMarks, list(quiz.marks = c(70L,75L, 80L, 85L),
                            viva.marks = c(7L, 5L, 8L, 6L)))
## Results: [1] 77 80 88 91


## Anonymous Functions
## Function without a name
## Use it if you have to create small functions

## Named function: a function with a function name
GetTotalMarks <- function(quiz.marks, viva.marks){
    total.marks <- quiz.marks + viva.marks
    total.marks
}

## Using named functions 
do.call(GetTotalMarks,list(quiz.marks = c(70L, 75L, 80L, 85L),
                           viva.marks = c(7L, 5L, 8L, 6L)))

## Results: [1] 77 80 88 91

## Using anonymous functions:
do.call(function(quiz.marks, viva.marks){
    quiz.marks + viva.marks
}, list(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L)))
## Results: [1] 77 80 88 91





              
              





