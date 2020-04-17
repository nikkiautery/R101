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














