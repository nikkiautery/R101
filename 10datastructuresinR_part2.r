## Data Structures, Part 2

## Data Frames, Common Operations on/with Data Frames, Matrices/Matrix, 
## Common Operations on/with Matrices/Matrix, Arrays

## Data Frames:
## Most popular data structure in R
## Heterogeneous; can contain elements of differnt classes
## 2-Dimensional in nature; rows and columns
## CReating lists are not efficient for large data sets; Data Frames are good
## for larger sets of data.


student.names <- c("Raj","Rahul", "Priya", "Poonam")
student.weights <- c(60.5, 72.5, 45.2, 47.5)
student.genders <- factor(c("Male", "Male", "Female", "Female"))
student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)

## Create a Data Frame:
## Data Frames should have an equal number of elements; each object is passed 
## into the Data Frame - each vector contains 4 elements.  
students <- data.frame(student.names,
                       student.weights,
                       student.genders,
                       student.physics.marks,
                       student.chemistry.marks)    
typeof(students)
students
str(students)

## Results:

## typeof(students)
## Results: [1] "list"
## A Data Frame is basically a list where each element of the list is a vector
## of equal length; this example is 5 vectors with a length of 4

## students
## Results: 
## student.names student.weights student.genders student.physics.marks student.chemistry.marks
## 1         Raj            60.5            Male                    70                      60
## 2       Rahul            72.5            Male                    75                      70
## 3       Priya            45.2          Female                    80                      85
## 4      Poonam            47.5          Female                    85                      70


## str(students)
## Results:
## 'data.frame':	4 obs. of  5 variables:
## $ student.names          : Factor w/ 4 levels "Poonam","Priya",..: 4 3 2 1
## $ student.weights        : num  60.5 72.5 45.2 47.5
## $ student.genders        : Factor w/ 2 levels "Female","Male": 2 2 1 1
## $ student.physics.marks  : int  70 75 80 85
## $ student.chemistry.marks: int  60 70 85 70

## Data Frames treat character string values as factors.
## You can use stringsAsFactors = BOOL (TRUE/FALSE) to change the default behavior
## stringsAsFactors = FALSE will prevent Data Frames from converting strings
## into factors.

students <- data.frame(student.names,
                       student.weights,
                       student.genders,
                       student.physics.marks,
                       student.chemistry.marks,
                       stringsAsFactors = FALSE)   
str(students)
## Results:
## 'data.frame':	4 obs. of  5 variables:
## $ student.names          : chr  "Raj" "Rahul" "Priya" "Poonam"
## $ student.weights        : num  60.5 72.5 45.2 47.5
## $ student.genders        : Factor w/ 2 levels "Female","Male": 2 2 1 1
## $ student.physics.marks  : int  70 75 80 85
## $ student.chemistry.marks: int  60 70 85 70  

## Subsetting: Extract element(S) from a Data Frame

students[1] ## Single brackets [] return element of same type
## Results:
## student.names
## 1         Raj
## 2       Rahul
## 3       Priya
## 4      Poonam

typeof(students[1])
## Results: [1] "list"

students[[1]] ## Double brackets [[]] return an object of its own type
## Results
## [1] "Raj"    "Rahul"  "Priya"  "Poonam"

typeof(students[[1]])
## Results: [1] "character"

students[["student.names"]] ## Double brackets [[]] return object of its own type
## Results: [1] "Raj"    "Rahul"  "Priya"  "Poonam"

typeof(students[["student.names"]])
## Results: [1] "character

students$student.names ## $ returns the object of its own type
## Results: [1] "Raj"    "Rahul"  "Priya"  "Poonam" 

typeof(students$student.names)
## Results: [1] "character"

students[1:3] ## Using sequence n:n to view a subset of the Data Frame
## Results:
## student.names student.weights student.genders
## 1        Raj            60.5            Male
## 2      Rahul            72.5            Male
## 3      Priya            45.2          Female
## 4     Poonam            47.5          Female    

students[c("student.physics.marks", "student.chemistry.marks")]
students
## Results:
## student.physics.marks student.chemistry.marks
## 1                  70                      60
## 2                  75                      70
## 3                  80                      85
## 4                  85                      70

students[1,2] ## Row number, column number 
## Results:
## [1] 60.5

students[1:3, 1:2] ## Extract only data from Rows 1-3 and Columns 1-2
## Results:
## student.names student.weights
## 1         Raj            60.5
## 2       Rahul            72.5
## 3       Priya            45.2

students[c(1,2), c(1,3)]
## Results:
## student.names student.genders
## 1         Raj            Male
## 2       Rahul            Male

students[,1] ## Get all values from Column 1
## Results: [1] "Raj"    "Rahul"  "Priya"  "Poonam"

students[1,] ## Get all values from row 1
## student.names student.weights student.genders student.physics.marks student.chemistry.marks
## 1         Raj            60.5            Male                    70                      60

students[c(T,F,T,F),] 
## Only select rows which T (TRUE) is indicated; select all columns
## Results:
## student.names student.weights student.genders student.physics.marks student.chemistry.marks
## 1         Raj            60.5            Male                    70                      60
## 3       Priya            45.2          Female                    80                      85

students[student.genders == "Male",] 
## Select all Male students from the rows, and all columns
## Results:
## student.names student.weights student.genders student.physics.marks student.chemistry.marks
## 1         Raj            60.5            Male                    70                      60
## 2       Rahul            72.5            Male                    75                      70

students[student.physics.marks >= 75,] 
## Select all students whose physics marks are >= 75, all columns
## Results:
## student.names student.weights student.genders student.physics.marks student.chemistry.marks
## 2       Rahul            72.5            Male                    75                      70
## 3       Priya            45.2          Female                    80                      85
## 4      Poonam            47.5          Female                    85                      70


## MATRICES: The Matrix
## Similar to Data Frames; 2-Dimensional (Rows, Columns)
## Different than Data Frames; They're Homogeneous; only contain data of similar 
## types only - usually numeric

student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)

student.marks <- rbind(student.physics.marks, student.chemistry.marks) 
## Row binding
student.marks
##Results:
##                         [,1] [,2] [,3] [,4]
## student.physics.marks     70   75   80   85
## student.chemistry.marks   60   70   85   70

student.marks <- cbind(student.physics.marks, student.chemistry.marks) 
## Column binding
student.marks
## Results:
##      student.physics.marks student.chemistry.marks
## [1,]                    70                      60
## [2,]                    75                      70
## [3,]                    80                      85
## [4,]                    85                      70

rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam") 
## Creating custom row names 
student.marks
## Results:
##        student.physics.marks student.chemistry.marks
## Raj                       70                      60
## Rahul                     75                      70
## Priya                     80                      85
## Poonam                    85                      70

str(student.marks)
## Results:
##  int [1:4, 1:2] 70 75 80 85 60 70 85 70 -- integer [rows, columns, contents]
## - attr(*, "dimnames")=List of 2 -- dimnames are dimension names in a list 
## which contain row and column names in a matrix
## ..$ : chr [1:4] "Raj" "Rahul" "Priya" "Poonam"
## ..$ : chr [1:2] "student.physics.marks" "student.chemistry.marks"

student.marks <- matrix(c(70L, 75L, 80L, 85L, 60L, 70L, 85L, 70L), ncol = 2, 
                        nrow = 4)
## Additional way to construct a Matrix
## This statement will automatically arrange 2 columns and 4 rows
student.marks
## Results:
##      [,1] [,2]
## [1,]   70   60
## [2,]   75   70
## [3,]   80   85
## [4,]   85   70

student.marks <- matrix(c(70L, 75L, 80L, 85L, 60L, 70L, 85L, 70L), ncol = 4, 
                        nrow = 2,
                        byrow = TRUE)
student.marks
## Results:
##      [,1] [,2] [,3] [,4]
## [1,]   70   75   80   85
## [2,]   60   70   85   70

## [r,c] = [row,column]
## USing a Matrix to store a collection of elements, the columns will be filled
## in order, by default - elements are arranged column-wise...
## Instead, using byrow = TRUE will arrange the elements by row instead.

## Common Operations to Perform on Matrices

student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)
student.marks <- cbind(student.physics.marks, student.chemistry.marks) 
rownames(student.marks) <- c("Raj", "Rahul", "Priya", "Poonam")
student.marks
## Results:
##        student.physics.marks student.chemistry.marks
## Raj                       70                      60
## Rahul                     75                      70
## Priya                     80                      85
## Poonam                    85                      70

## Subsetting: Extract element(S) from Matrix
## It is most common to use [] single brackets and commas , when subsetting
## matrices.
    
student.marks[,] ## [Row Number, Column Number] 
student.marks[2,2]
student.marks[2,]
student.marks[,2]
student.marks[1:3,]
student.marks[c(1,3),]
student.marks[c(T,F,F,T),]

## Results:

## student.marks[,] ## [Row Number, Column Number]
##        student.physics.marks student.chemistry.marks
## Raj                       70                      60
## Rahul                     75                      70
## Priya                     80                      85
## Poonam                    85                      70

##student.marks[2,2]
## Results: [1] 70

## student.marks[2,]
## Result:
## student.physics.marks student.chemistry.marks 
##                   75                      70 

## student.marks[,2]
## Raj  Rahul  Priya Poonam 
##  60     70     85     70 

## student.marks[1:3,]
##       student.physics.marks student.chemistry.marks
## Raj                      70                      60
## Rahul                    75                      70
## Priya                    80                      85

## student.marks[c(1,3),]
##       student.physics.marks student.chemistry.marks
## Raj                      70                      60
## Priya                    80                      85

## student.marks[c(T,F,F,T),]
##        student.physics.marks student.chemistry.marks
## Raj                       70                      60
## Poonam                    85                      70

## Summary Operations:
student.marks
rowSums(student.marks) ## Row-wise sum; adds all values in a row
colSums(student.marks) ## Column-wise sum; adds all values in a column
colMeans(student.marks) ## Column-wise mean; calculates the mean of the columns

## Results:

## student.marks
##        student.physics.marks student.chemistry.marks
## Raj                       70                      60
## Rahul                     75                      70
## Priya                     80                      85
## Poonam                    85                      70

## rowSums(student.marks) ## Row-wise sum
## Raj  Rahul  Priya Poonam 
## 130    145    165    155 

## colSums(student.marks) ## Column-wise sum
## student.physics.marks student.chemistry.marks 
##                   310                     285 

## colMeans(student.marks) ## Column-wise mean/average
## student.physics.marks student.chemistry.marks 
##                 77.50                   71.25 

## Arrays
## Arrays are not common in data analysis projects; 
## They are homogenous; they can only contain similar elements
## Arrays are n-Dimensional: more "sheets" (2D), more dimensions! 
## Example, multiple classes; multiple matrices stacked upon each other.

class1.student.physics.marks <- c(70L, 75L, 80L, 85L)
class1.student.chemistry.marks <- c(60L, 70L, 85L, 70L)
class1.student.marks <- cbind(class1.student.physics.marks, 
                              class1.student.chemistry.marks)
class1.student.marks
## Results:
##      class1.student.physics.marks class1.student.chemistry.marks
## [1,]                           70                             60
## [2,]                           75                             70
## [3,]                           80                             85
## [4,]                           85                             70

class2.student.physics.marks <- c(71L, 76L, 81L, 86L)
class2.student.chemistry.marks <- c(61L, 71L, 86L, 71L)
class2.student.marks <- cbind(class2.student.physics.marks, 
                              class2.student.chemistry.marks)
class2.student.marks
## Results:
##      class2.student.physics.marks class2.student.chemistry.marks
## [1,]                           71                             61
## [2,]                           76                             71
## [3,]                           81                             86
## [4,]                           86                             71

## Creating the Array:

student.marks <- array(c(class1.student.marks, class2.student.marks), dim =
                           c(4,2,2))
## Dimension values represent c(number of rows, number of cols, number of matrices)

student.marks 
## Results:
## , , 1

##      [,1] [,2]
## [1,]   70   60
## [2,]   75   70
## [3,]   80   85
## [4,]   85   70

## , , 2

##      [,1] [,2]
## [1,]   71   61
## [2,]   76   71
## [3,]   81   86
## [4,]   86   71


## Extracting one or more elements from array(s)

student.marks[2,2,2] ## Extract row 2, column 2, from matrix 2
## Results: [1] 71

student.marks[1:3, 2, ] ## Extract rows 1-3 from column two, from both matrices
## Results:
##      [,1] [,2]
## [1,]   60   61
## [2,]   70   71
## [3,]   85   86



