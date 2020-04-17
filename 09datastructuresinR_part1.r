## Data Structures, Part 1

## Data Structures in R are a collection of data elements groupd under one name
## Data Structures act as a "container"

## What kind of items/objects?

## Homegeneous Data Structure - Similar/same types of data objects
## Homogeneous Data Structures: Atomic Vector, Matrix, Array

## Heterogenous Data Structure - Dissimilar/different types of data objects
## Heterogenous Data Structures: Lists, Data Frames

## How do to arrange different items?
## Note: D = Dimension(al)

## Homogeneous Data Strucutres:
## Atomic Vector - 1D; Matrix - 2D; Array - nD

## Heterogeneous Data Structures:
## Lists - 1D; Data Frames - 2D

## Basic Classes of Objects:
## Atomic Classes: Characters; Numeric; Integers; Logical; Complex Atomic 1 + 7a
## Complex Atomic: Think Algebra - a real number and an imaginary number, ex. 8i

## Atomic Vector:
## Commonly known as "vectors"
## Homogenous in structure and should be of the same class only.
## Character vector, for example ["a","B","C","d"]
## Numeric vector, for example [1.2, 4.37, 1.9]
## Integer vector, for example [1, 2, 3, 4]
## Logical vector, for example [TRUE, FALSE, FALSE, TRUE, FALSE]
## Complex vector, for example [8i + 6, 6i, 9i * 9i]
## 1 Dimensional arrangement of items; one after another


student.names <- c("Nikki", "Will", "Michelle", "Michael", "Chris", "Chelsea")
## Character vector; all names are combined using c() function
## Characters are wrapped in "x" or 'x'
student.names
## Print the student names
str(student.names)
## Get the vector structure (character)
is.character(student.names)
## Confirm structure (character); TRUE

## RESULTS:

## student.names <- c("Nikki", "Will", "Michelle", "Michael", "Chris", "Chelsea")
## Student.names
## [1] "Nikki"    "Will"     "Michelle" "Michael"  "Chris"    "Chelsea" 
## str(student.names)
## chr [1:6] "Nikki" "Will" "Michelle" "Michael" "Chris" "Chelsea" ## Index [1:6]
## is.character(student.names)
## [1] TRUE


student.weights <- c(80.5, 85.0, 94.5, 94.5, 70.8, 43.2)
## Numeric vector
str(student.weights)
## Get the vector structure (numeric)
is.numeric(student.weights)
## Confirm structure of student.weights; TRUE

## RESULTS:

## student.weights <- c(80.5, 85.0, 94.5, 94.5, 70.8, 43.2)
## str(student.weights)
## num [1:6] 80.5 85 94.5 94.5 70.8 43.2
## is.numeric(student.weights)
## [1] TRUE


student.physics.marks <- c(70L, 75L, 80L, 80L, 60L, 30L)
## Integer Vector; capital L explicitly marks INTEGERS vs. Numbers so NO decimal
## Without the L, the numbers would be treated as numeric real with decimals
str(student.physics.marks)
## Confirm the structure; Integer
is.integer(student.physics.marks)
## Confirm the structure is Integer; TRUE

## student.physics.marks <- c(70L, 75L, 80L, 80L, 60L, 30L)
## str(student.physics.marks)
## int [1:6] 70 75 80 80 60 30
## is.integer(student.physics.marks)
## [1] TRUE


is.numeric(student.physics.marks)
## Integer can also be considered numeric
is.integer(student.weights)
## But Numeric may not be an integer

## Integer may also be numeric, but the converse may not be true

RESULTS:
## is.numeric(student.physics.marks)
## [1] TRUE
## is.integer(student.weights)
## [1] FALSE


student.physics.interest <- c(FALSE, T, FALSE, TRUE, F, FALSE)
## Logical vectors express the interest of students in physics as a topic
## Can either use TRUE or FALSE, or T or F - must be in capital letters
str(student.physics.interest)
## Confirm the structure is Logical (bool)
is.logical(student.physics.interest)
## Confirm that the vector is logical in structure

## RESULTS:

## str(student.physics.interest)
## logi [1:6] FALSE TRUE FALSE TRUE FALSE FALSE
## is.logical(student.physics.interest)
## [1] TRUE

complex.vector <- c(10 + 2i, -1 + 10i, 4 + 3i, 7 + 8i)
str(complex.vector)
is.complex(complex.vector)

RESULTS:
## complex.vector <- c(10 + 2i, -1 + 10i, 4 + 3i, 7 + 8i)
## str(complex.vector)
## cplx [1:4] 10+2i -1+10i 4+3i ...
## is.complex(complex.vector)
## [1] TRUE


## Create Atomic Vectors using the vector() function:

vector("character", length = 4) ## Default: empty string
## Result: [1] "" "" "" ""

vector("numeric", length = 4) ## Default: 0
## Result: [1] 0 0 0 0

vector("integer", length = 4) ## Default: 0
## Result: [1] 0 0 0 0

vector("logical", length = 4) ## Default: FALSE
## Result: [1] FALSE FALSE FALSE FALSE

vector("complex", length = 4) ## Default: 0 + 0i
## Result: [1] 0+0i 0+0i 0+0i 0+0i

## Common Operations on Atomic Vectors:

## Arithmetic & Logical
## Subsetting
## Coercion

## Performing arithmetic and logical operations on atomic vectors:

student.psychology.marks <- c(70L, 75L, 80L, 85L)

student.biology.marks <- c(60L, 70L, 85L, 70L)

student.science.marks <- student.psychology.marks + student.biology.marks
student.science.marks

## Extract element(s) from atomic vectors by subsetting

student.names
## Result: [1] "Nikki"    "Will"     "Michelle" "Michael"  "Chris"    "Chelsea" 
student.names[1] ## Extract the FIRST Name
student.names[2] ## Extract the SECOND Name
student.names[3] ## Extract the THIRD Name
student.names[4] ## Extract the FOURTH Name
student.names[5] ## Extract the FIFTH Name
student.names[6] ## Extract the SIXTH Name
student.names[1:4] ## Extract multiple elements, the 1st through 4th Names
student.names[c(T,T,T,T,T,F)] ## Extract multiple elements with logical vector
student.names[student.physics.marks >= 75] ## Extract students with marks 75+

## Coercion: Converting one type to another, also known as Type Casting or 
## Type Conversion

## Implicit Coercion

student.weights <- c(60.5, 72.5, 45.2, "47.5")
str(student.weights)
## Result:  chr [1:4] "60.5" "72.5" "45.2" "47.5"

## Explicit Coercion
## Sensible Coercion

as.numeric(student.physics.marks >= 75) # Converting a logical value to numeric
## Result: [1] 0 1 1 1 0 0

as.character(student.physics.marks) # Converting integer to character
## Result: [1] "70" "75" "80" "80" "60" "30"

student.weights <- c(60.5, 72.5, 45.2, 47.5) # Numeric (double) atomic vector
student.weights
## Results: [1] 60.5 72.5 45.2 47.5

as.integer(student.weights)
## Results: [1] 60 72 45 47

## Coercions which are not sensible

as.numeric(student.names) ## Converting names to numeric values
## Results:
## [1] NA NA NA NA NA NA
## Warning message:
## NAs introduced by coercion 

## Factors are special types of vectors which are used to store nominal values
## Categorial means that the field can take values from certain categories
## Categorical is "nominal"
## Example, gender is nominical/categorical field, can be used with Factors.

## Character Vector:
student.genders <- c("Male", "Male", "Female", "Female")
student.genders
## Results: 
## [1] "Male"   "Male"   "Female" "Female"

## Using Factor:
student.genders <- factor(c("Male", "Male", "Female", "Female"))
student.genders
## Results:
## [1] Male   Male   Female Female
## Levels: Female Male

## Integer Vector: These integers are not self-describing
student.genders <- c(2L, 2L, 1L, 1L)
student.genders
## Results:
## [1] 2 2 1 1

## Explicit Coercion: Using factors will help with numeric values which are
## self-describing for use in comparisons and other operations.
## Internally, factors are integers. Levels are decided alphabetically, which
## is why the as.numeric() function returns Male as 2 and Female as 1
## Levels can be created implicitly or explicity. 
student.genders <- factor(c("Male", "Male", "Female", "Female"))
student.genders
## Results: (Note: Not wrapped in quotes)
## [1] Male   Male   Female Female
## Levels: Female Male
as.numeric(student.genders)
## Results: [1] 2 2 1 1

## Defining levels explicitly: 
student.blood.groups <- factor(c("A", "AB", "O", "AB"), 
levels = c("A", "B", "AB", "O"))
str(student.blood.groups) ## str() to view the structure of the vector
## Results: Factor w/ 4 levels "A","B","AB","O": 1 3 4 3

## String comparisions are inefficient compared to integer comparisons
## USe factors for storing nominal or categorical variables.
## Additional levels can be created. They can be implicitly or explicitly 
## created and/or ordered.

## Lists
## A heterogeneous data structure; can contain items of multiple types
## There is a 1-Dimensional (1D) arrangement in lists. Ex. (1, 2, 3, 4)
## Lists will help to merge/combine information between vectors of different 
## types; for example, the name, weights, individual class grades, gender, and
## blood type of each student, by student.

student.names[1]
## Result: [1] "Nikki"

student.weights[1]
## Result: [1] "60.5"

student.genders[1]
## Results:
## [1] Male
## Levels: Female Male

student.physics.marks[1]
## Results: [1] 70

## This is insufficeint due to having to list out each vector and the index

student.names <- c("Raj", "Rahul", "Priya", "Poonam")
student.weights <- c(60.5, 72.5, 45.2, 47.5)
student.genders <- factor(c("Male", "Male", "Female", "Female"))
student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)

## Creating an Unnammed List:
student1 <- list(student.names[1], student.weights[1], student.genders[1], 
                 student.physics.marks[1], student.chemistry.marks[1])

str(student1)
## Results list data type and contents:
## List of 5
## $ : chr "Raj"
## $ : num 60.5
## $ : Factor w/ 2 levels "Female","Male": 2
## $ : int 70
## $ : int 60

student1
## Results:
## [[1]]
## [1] "Raj"

## [[2]]
## [1] 60.5

## [[3]]
## [1] Male
## Levels: Female Male

## [[4]]
## [1] 70

## [[5]]
## [1] 60

student2 <- list(student.names[2], studnt.weights[2], student.genders[2], 
                 student.physics.marks[2], student.chemistry.marks[2])

student3 <- list(student.names[3], student.weights[3], student.genders[3], 
                 student.physics.marks[3], student.chemistry.marks[3])

student4 <- list(student.names[4], student.weights[4], student.genders[4], 
                 student.physics.marks[4], student.chemistry.marks[4])


## Creating a Named List:

student1 <- list(name = student.names[1], weight = student.weights[1], 
                 gender = student.genders[1], 
                 physics = student.physics.marks[1], 
                 chemistry =student.chemistry.marks[1])

str(student1)
## Results:
## List of 5
## $ name     : chr "Raj"
## $ weight   : num 605
## $ gender   : Factor w/ 2 levels "Female","Male": 2
## $ physics  : int 70
## $ chemistry: int 60

student1
## Results:
## $name
## [1] "Raj"

## $weight
## [1] 605

## $gender
## [1] Male
## Levels: Female Male

## $physics
## [1] 70

## $chemistry
## [1] 60

## Lists can also contain vectors (previous demos only depict atomic types)

student1 <- list(name = student.names[1], weight = student.weights[1], 
                 gender = student.genders[1], 
                 marks = c(student.physics.marks[1], student.chemistry.marks[1]))

str(student1)
## Results:
## List of 4
## $ name  : chr "Raj"
## $ weight: num 605
## $ gender: Factor w/ 2 levels "Female","Male": 2
## $ marks : int [1:2] 70 60

## Subsetting: Extract element(s) using unnamed list

student.names <- c("Raj", "Rahul", "Priya", "Poonam")
student.weights <- c(60.5, 72.5, 45.2, 47.5)
student.genders <- factor(c("Male", "Male", "Female", "Female"))
student.physics.marks <- c(70L, 75L, 80L, 85L)
student.chemistry.marks <- c(60L, 70L, 85L, 70L)

student1 <- list(student.names[1], student.weights[1], student.genders[1], 
                 student.physics.marks[1], student.chemistry.marks[1])

## Single Brackets [] return element of same type:
## If you subset a vector using [], you will get a vector; if you subset a list
## using [], you will get a list as shown below.

student1[1]
## Results: 
## [[1]]
## [1] "Raj"

typeof(student1[1])
## Results: [1] "list"

## Double brackets [[]] return an object of its own type
## When using [[]], the data returned will be the type of the element itself
## from within the list/vector. If the element is a character, than [[]]
## will show the character type object. This is shown below.

student1[[1]]
## Results : [1] "Raj"

typeof(student1[[1]])
## Results [1] "character"

## Access multiple elements using index sequencing [n:n is a "sequence"]

student1[1:3]
## Results:
## [[1]]
## [1] "Raj"

## [[2]]
## [1] 60.5

## [[3]]
## [1] Male
## Levels: Female Male

## When performing the above on an unnamed list/vector, you have to remember 
## the index or the order number of the data in that list/vector for each
## element; this is not true with named lists.

## Subsetting elements using a named list:

student1 <- list(name = student.names[1], weight = student.weights[1], 
                 gender = student.genders[1], 
                 physics = student.physics.marks[1], 
                 chemistry =student.chemistry.marks[1])

student1[["name"]]
student1$gender ## Access element using name or label, using $ = no quotes
student1[c("physics", "chemistry")] ## Access multiple elements using labels

## RESULTS:
## student1[["name"]]
## [1] "Raj"
## student1$gender ## Access element using name or label
## [1] Male
## Levels: Female Male
## student1[c("physics", "chemistry")] ## Access multiple elements using labels
## $physics
## [1] 70
## $chemistry
## [1] 60

## USe length() function to get the total number of elements in the list:

length(student1)
## Results: [1] 5









