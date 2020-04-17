## Environments and Variables

x <- 300
y <- "hello"

## These variables are created in the Global Environment
 
## Another 'x' variable can also exist in another custom environment

## To create another (custom) environment:

my.environment <- new.env()
my.environment[["x"]] <- 10
my.environment$x <- 10
get("x", my.environment) ## to call the variable contents
my.environment[["x"]] ## to call the variable contents
my.environment$x ##to call the variable contents

match.score <- 300 # assign variable
match.score # view variable contents
get("match.score", globalenv()) 
# call the contents of the variable from the global environment

## create a custom environment
my.environment <- new.env() 
parent.env(my.environment) ##check parent environment

## Assign variable in a custom environment
assign("match.score", 320, my.environment) ## assign variable in custom env.
my.environment[["match.score"]] <- 320 ## assign a variable in custom env.
my.environment$match.score <- 320 ## assign a variable in a custom env.

## Get variable from custom environment
get("match.score", my.environment)
my.environment[["match.score"]] 
my.environment$match.score


