## If Statement: 
  ## Used for conditional execution
  ## If (condition) {
    ## execute body if condition evaluates to TRUE
##  }
  
## Condition
  ## Logical Values: e.g. TRUE/FALSE
  ## Logical Vector Length of 1, e.g. [1] TRUE

IsGoodPerformanceByBatch <- function(test.marks){
    average.marks <- mean(test.marks)
    performance.test <- average.marks >= 75
    print(paste("average marks :", average.marks, "performance test :", 
                performance.test))
    if(performance.test){
        print("Overall performance test of the batch is brilliant")
    }
    print("Performance test completed")
}

IsGoodPerformanceByBatch(test.marks = c(70L, 75L, 80L, 85L))
## Results:
## [1] "average marks : 77.5 performance test : TRUE"
## [1] "Overall performance test of the batch is brilliant"
## [1] "Performance test completed"

IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 60L, 70L))
## Results:
## [1] "average marks : 58.75 performance test : FALSE"
## [1] "Performance test completed"


## If-Else:
## if (condition) {
## execute body if condition evaluates to TRUE
## }
## else {
## execute body if condition evaluates to FALSE
## }


IsGoodPerformanceByBatch <- function(test.marks){
    average.marks <- mean(test.marks)
    performance.test <- average.marks >= 75
    print(paste("Average marks :", average.marks, "Performance test :", 
                performance.test))
    if(performance.test){
        print("Overall performance test of the batch is brilliant")
    }
    else{
        print("Overall performance of the batch is average")
    }
    print("Performance test completed")
}

IsGoodPerformanceByBatch(test.marks = c(70L, 75L, 80L, 85L))
## Results:
## [1] "Average marks : 77.5 Performance test : TRUE"
## [1] "Overall performance test of the batch is brilliant"
## [1] "Performance test completed"

IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 60L, 70L))
## Results:
## [1] "Average marks : 58.75 Performance test : FALSE"
## [1] "Overall performance of the batch is average"
## [1] "Performance test completed"


## Multiple If-Else:

## if(condition){
## execute body if TRUE
## }
## else if(condition 2){
## execute body if condition 2 is TRUE
## }
## else{
## execute body if all conditions are FALSE
## }

IsGoodPerformanceByBatch <- function(test.marks) {
    average.marks <- mean(test.marks)
    print(paste("Average Marks: ", average.marks))
    if(average.marks >= 75){
        print("Overall performance is brilliant!")
    }
    else if(average.marks >= 60){
        print("Overall performance is satisfactory.")
    }
    else{
        print("Overall performance is below average.")
    }
    print("Performance Test Completed!")
}

IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 60L, 70L))
## Results: 
## [1] "Average Marks:  77.5"
## [1] "Overall performance is brilliant!"
## [1] "Performance Test Completed!"

IsGoodPerformanceByBatch(test.marks = c(50L, 60L, 60L, 70L))
## Results:
## [1] "Average Marks:  60"
## [1] "Overall performance is satisfactory."
## [1] "Performance Test Completed!"

IsGoodPerformanceByBatch(test.marks = c(50L, 55L, 50L, 70L))
## Results:
## [1] "Average Marks:  56.25"
## [1] "Overall performance is below average."
## [1] "Performance Test Completed!"


## TEST:

SystemGroup <- function(system.weight) {
    average.weight <- mean(system.weight)
    print(paste("Average Weight: ", average.weight))
    if(average.weight >= 56){
        print("System is Group 3+ and Requires an RPA!")
    }
    else if(average.weight >= 20){
        print("System is Group 2! This batch is Man Pack or Man Port.")
    }
    else if(average.weight < 20 && average.weight >= 8){
        print("System is Group 1! This batch is likely Man Pack.")
    }
    else if(average.weight < 8){
        print("System is Group 1! This batch is likely RR.")
    }
    else{
        print("Could not determine batch average weight.")
    }
    print("Batch Test Completed!")
}

SystemGroup(system.weight = c(30, 11, 8, 12))
SystemGroup(system.weight = c(50, 80, 9, 70))
SystemGroup(system.weight = c(130, 11, 8, 12))
SystemGroup(system.weight = c(3, 11, 8, 20))
SystemGroup(system.weight = c(5, 6, 8, 3))
SystemGroup(system.weight = c(2, 2, 2, 2))


## Switch Statement: incorporating multiple conditions "easily"

## switch(expression,
## option1 = { executes if expression evaluates to option1
## },
## option2 = {executes if expression evaluates to option2
## },
## default value
## )

## The above expression should be evaluated to a string or integer value
## If none of the options evaluate to a provided option, then the default value
## will be returned.
## If no default value is provided, NULL will be returned instead.

GetMarkSummary <- function(test.marks, summary.type){
    result <- switch(summary.type, ## summary.type is the expression to be evaluated; character string
                     "mean" = {
                         mean(test.marks)
                     },
                     "median" = {
                         median(test.marks)
                     },
                     "variance" = {
                         var(test.marks)
                     },
                     "Not Implemented"
                     )
    ## Result <- switch(summary.type,
    ##                  "mean" = mean(test.marks),
    ##                  "median" = median(test.marks),
    ##                  "variance" = var(test.marks),
    ##                  "Not Implemented")
    ## Curly braces can be removed such as the above if only one statement exists in an option;
    ## if there is more than one option/statement, then the curly braces must be used
    
    result
}

GetMarkSummary(test.marks = c(70L, 75L, 80L, 85L), "mean")
## Result: [1] 77.5

GetMarkSummary(test.marks = c(70L, 75L, 80L, 85L), "median")
## Result: [1] 77.5

GetMarkSummary(test.marks = c(70L, 75L, 80L, 85L), "variance")
## Result: [1] 41.66667

GetMarkSummary(test.marks = c(70L, 75L, 80L, 85L), "unknown")
## Result: [1] "Not Implemented"


## Vectorized If:
## Work on logical vector without using any explicit loops
## Typically, logical vector can be generated by a logical expression
## Use of ifelse function

## typical structure:
## ifelse(test vector, true vector, false vector)

## If true/false vector is shorter in length, it will be recycled.
## i.e. if test vector had 4 elements, and the true or false vector had only 1 element, 
## then, one element will be repeated 3 more times internall to create a vector
## of 4 elements.
## Returns NA if test vector contains NA


test.marks <- c(70L, 75L, 80L, NA)
test.marks >= 75
## Results: [1] FALSE  TRUE  TRUE    NA

ifelse(test.marks >= 75, c("Great", "Bravo", "Excellent", "Congrats"),
                         c("Keep it up", "Not bad", "Just missed", "Just ok"))
ifelse(test.marks >= 75, "With Distinction", "Without Distinction")

## Results:
## ifelse(test.marks >= 75, c("Great", "Bravo", "Excellent", "Congrats"),
##                          c("Keep it up", "Not bad", "Just missed", "Just ok"))
## [1] "Keep it up" "Bravo"      "Excellent"  NA          
##  ifelse(test.marks >= 75, "With Distinction", "Without Distinction")
## [1] "Without Distinction" "With Distinction"    "With Distinction"    NA 


## Repeat Loop:
## Used for Looping
## Structure:
## repeat{
## execute body forever
## }

WriteOnNotebook <-function()
{
    count <- 0
    repeat{
        count <- count + 1
        print(paste("Writing on page number", count))
        }
}

## DO NOT RUN THE CODE ABOVE!!! 


## Repeat with Break:

## repeat{
## execute body
## if(condition) {
##                   some task
##                   break
##                }
## execute body
## }

WriteOnNotebook <-function(total.page.count)
{
    count <- 0
    repeat{
        count <- count + 1
        if(count > total.page.count){
            print("Page Finished.")
            break
        }
        print(paste("Writing on page number", count))
    }
}

WriteOnNotebook(total.page.count = 10)
## Results:
## [1] "Writing on page number 1"
## [1] "Writing on page number 2"
## [1] "Writing on page number 3"
## [1] "Writing on page number 4"
## [1] "Writing on page number 5"
## [1] "Writing on page number 6"
## [1] "Writing on page number 7"
## [1] "Writing on page number 8"
## [1] "Writing on page number 9"
## [1] "Writing on page number 10"
## [1] "Page Finished."


## Repeat with Next: can be used to skip loops
## repeat{
## execute body
## if(condition) {
    ## some task
    ## break
## }
## if(condition) { some task
    ## next       skip current loop and start nex
##               }
## execute body
## }

WriteOnNotebook <-function(total.page.count)
{
    count <- 0
    repeat{
        count <- count + 1
        if(count > total.page.count){
            print("Page Finished.")
            break
        }
        if(count %% 2 == 0){
            print(paste("Skipping page number", count))
            next
        }
        print(paste("Writing on page number", count))
    }
}

WriteOnNotebook(total.page.count = 10)
## Results:
## [1] "Writing on page number 1"
## [1] "Skipping page number 2"
## [1] "Writing on page number 3"
## [1] "Skipping page number 4"
## [1] "Writing on page number 5"
## [1] "Skipping page number 6"
## [1] "Writing on page number 7"
## [1] "Skipping page number 8"
## [1] "Writing on page number 9"
## [1] "Skipping page number 10"
## [1] "Page Finished."


## While Loops: 
## Check conditions before entering a loop
## Structure:
## while(condition){
## execute body so long as the condition evaluates to TRUE
## }

WriteOnNotebook <- function(total.page.count)
{
    count <- 0
    while(count < total.page.count) {
        count <- count + 1
        print(paste("Writing on page number", count))
    }
    print("Page finished.")
}

WriteOnNotebook(total.page.count = 10)
## Results:
## [1] "Writing on page number 1"
## [1] "Writing on page number 2"
## [1] "Writing on page number 3"
## [1] "Writing on page number 4"
## [1] "Writing on page number 5"
## [1] "Writing on page number 6"
## [1] "Writing on page number 7"
## [1] "Writing on page number 8"
## [1] "Writing on page number 9"
## [1] "Writing on page number 10"
## [1] "Page finished."


## For Loop:
## Loop through a vector

## for(iterator in vector) {
## execute body
## }

WriteOnNotebook <- function(total.page.count)
{
    for(count in 1:total.page.count){
        print(paste("Writing on Page Number:", count))
    }
    print("Page Finished!")
}

WriteOnNotebook(total.page.count = 10)
## Results:
## [1] "Writing on Page Number: 1"
## [1] "Writing on Page Number: 2"
## [1] "Writing on Page Number: 3"
## [1] "Writing on Page Number: 4"
## [1] "Writing on Page Number: 5"
## [1] "Writing on Page Number: 6"
## [1] "Writing on Page Number: 7"
## [1] "Writing on Page Number: 8"
## [1] "Writing on Page Number: 9"
## [1] "Writing on Page Number: 10"
## [1] "Page Finished!"



## Apply: more advanced flow control mechanism
## Widely used in data analysis
## Returns a vector or array list of values obtained by applying a function
## to margins of an array or matrix.
## Margins - rows, columns, or both (each element)

## apply(data, margin, function)

## Margin: rows - 1, columns - 2, both - 1:2

## DEMO 1: Inefficient way to find the total sum of marks for each student - 7+ lines of code! 
## DEMO 2 using Apply will achieve the same results using a single line of code.

student.marks <- matrix(c(70L, 75L, 72L, 80L, 50L,
                          80L, 85L, 60L, 72L, 88L,
                          60L, 70L, 87L, 55L, 90L,
                          85L, 70L, 74L, 86L, 78L), ncol = 5, nrow = 4, byrow = TRUE)

rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
colnames(student.marks) <-
    c("Physics", "Chemistry", "Mathematics", "Biology", "History")
student.marks
## Results:
##        Physics Chemistry Mathematics Biology History
## Raj         70        75          72      80      50
## Rahul       80        85          60      72      88
## Priya       60        70          87      55      90
## Poonam      85        70          74      86      78

result <- vector("numeric", length = nrow(student.marks)) ## stores total values for each student
for(row in 1:nrow(student.marks)){                        ## iterates through number of rows in the matrix
    sum <- 0                                              ## setting the variable sum to 0    
    for(column in 1:ncol(student.marks)){                 ## iterates through the number of columns in the matrix
        sum <- sum + student.marks[row, column]           ## adding the cell value to the sum variable
    }                                                     ## will return total marks obtained by one student  
    result[row] <- sum                                    ##
}                                                         ## assigns the sum total to the result vector using proper indexing
result                                                    ## print the result.

## Result: [1] 347 385 362 393


## DEMO 2: Using Apply

apply(student.marks, 1, sum)
## Results:    Raj  Rahul  Priya Poonam 
##             347    385    362    393 

apply(student.marks, 1, max)
## Results:    Raj  Rahul  Priya Poonam 
##              80     88     90     86 

apply(student.marks, 1, which.max)
## Results:    Raj  Rahul  Priya Poonam 
##               4      5      5      4 

colnames(student.marks)[apply(student.marks, 1, which.max)]
## Results: [1] "Biology" "History" "History" "Biology"

apply(student.marks, 2, mean)
## Results:  Physics   Chemistry Mathematics     Biology     History 
##             73.75       75.00       73.25       73.25       76.50 

apply(student.marks, 2, max)
## Results:   Physics   Chemistry Mathematics     Biology     History 
##                 85          85          87          86          90 

rownames(student.marks)[apply(student.marks, 2, which.max)]
## Results: [1] "Poonam" "Rahul"  "Priya"  "Poonam" "Priya" 

apply(student.marks, 1:2, function(x) x + 2)
## Results:        Physics Chemistry Mathematics Biology History
##          Raj         72        77          74      82      52
##          Rahul       82        87          62      74      90
##          Priya       62        72          89      57      92
##          Poonam      87        72          76      88      80



## Functions in Apply Family:
## lapply: input - list, vector; output - list
## sapply: input - list, vector; oupput - vector, matrix, array
## vapply: input - list, vector; output - vector, matrix, array

## rapply: recursive version of lappy
## mapply: multivariate version of sapply





