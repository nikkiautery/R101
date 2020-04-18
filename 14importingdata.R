## Importing Data

## Working directory
## Default location for any file to read or write
## Until explicit path is specified
## Make sure you are working in the desired directory

## getwd() to get the current directory
## setwd() to set the working directory

## Set working directory

getwd()
setwd("C:\\users\\USER\\documents\\r") #Windows
setwd("C:/Users/USER/documents/r") #Windows
getwd()
setwd(file.path("C:", "Users","USER", "Documents", "R", "pluralsight_programmingwithr",
                "01.R_Programming_Fundamentals"))
getwd()

## OR... Session > Set Working Directory > Choose Directory

## Import CSV

## Comma Separated Values Files
## Very common format for storing data
## There is likely header information in the file
## The row represents one data instance, stored and separated by commas
## The column represents an attribute or feature
## To import CSV files in R, use read.csv() function
## read.csv(filename) <- the file name is required to read. read.csv() 
## read.csv(filename, header = TRUE) if CSV file does not have headers, use falls FALSE
## read.csv(filename, header = TRUE, sep = ",") indicate the type of separator using sep =
## my.data <- read.csv(filename, header = TRUE, sep = ",")


## Set working directory to: 
## setwd("C:/Users/USER/Documents/R/pluralsight_programmingwithr/
## 01.R_Programming_Fundamentals/r-programming-fundamentals/9-r-programming-fund-m9-exercise-files/data")

file <- file.path("data","01Sample.csv")
my.data <- read.csv(file)
str(my.data)
## Results:
## 'data.frame':	4 obs. of  2 variables:
## $ student.physics.marks  : int  70 75 80 85
## $ student.chemistry.marks: int  60 70 85 70

my.data
## Results:
##   student.physics.marks student.chemistry.marks
## 1                    70                      60
## 2                    75                      70
## 3                    80                      85
## 4                    85                      70


## Import Table
## Tabular data; uses rows and columns to store the data

## File Type:

## CSV, Separator: comma, for decimal points . (dot)
## CSV2, Separator: semicolon, for decimal points , (comma)
## tab delimited: \t (tab), for decimal points . (dot)
## tab delimited: \t (tab), for decimal points , (comma)

## use read.table() function to read tabular data
## read.table(tablename) will return a data frame; header is set to FALSE by default
## separator is set to a space/white space by default.
## read.table(file, header = FALSE, sep = "", dec = ".")
## Other Attributes:
## stringsAsFactors - defines whether to treat strings as factors or not
## colclasses - vector classes for columns
## skip - specify number of lines to skip before reading data
## nrows - specify the number of rows to read

## set working directory
setwd(file.path("C:", "Users", "USER", "Documents", "R", "pluralsight_programmingwithr",
                "01.R_Programming_Fundamentals","r-programming-fundamentals",
                "9-r-programming-fund-m9-exercise-files"))
file <- file.path("data","02Sample.txt")

my.data <- read.table(file,
                      header = TRUE,
                      skip = 1,
                      colClasses = c("character", "factor", "numeric", "integer",
                                     "integer"))
str(my.data)

## Results:
## 'data.frame':	4 obs. of  5 variables:
## $ student.name           : chr  "Raj" "Rahul" "Priya" "Poonam"
## $ student.gender         : Factor w/ 2 levels "Female","Male": 2 2 1 1
## $ student.weights        : num  60.5 72.5 45.2 47.5
## $ student.physics.marks  : int  70 75 80 85
## $ student.chemistry.marks: int  60 70 85 70


## Import from URL:

## File may not be available on local machine; download from a URL
## Built-in web server in R

## my.data <- read.table(URL) will download and encode the file if it is tabular
## The file will be downloaded to a temporary location. 
## Download the file to a local folder:
##    download.file(url, localFile)

## If the table is tabular, you can use read.table()

## my.data <- read.table(localFile)

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
setwd(file.path("C","Users","USER","Documents","R","pluralsight_programmingwithr",
                "01.R_Programming_Fundamentals","r-programming-fundamentals",
                "9-r-programming-fund-exercise-files"))
local <- file.path("data","03.DownloadedFile.data")
download.file(url, local)
my.data <- read.table(local, sep = ",")
str(my.data)

## Use rCurl package for advanced scenarios; downloading from a secure site,
## handling redirection, or password authentication - good for webscraping activities.

## Results:

## 'data.frame':	150 obs. of  5 variables:
## $ V1: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
## $ V2: num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
## $ V3: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
## $ V4: num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
## $ V5: Factor w/ 3 levels "Iris-setosa",..: 1 1 1 1 1 1 1 1 1 1 ...


## Importing XML Files
## Extensible Markup Language is very common in data analysis

file <- file.path("data","04Sample.xml")
install.packages("XML")
library(XML)
my.data <- xmlToDataFrame(file,
                          colClasses=c("character","integer","integer"),
                                         stringAsFactors=FALSE)

str(my.data)
## Results:
## 'data.frame':	4 obs. of  3 variables:
## $ name     : chr  "Raj" "Rahul" "Priya" "Poonam"
## $ physics  : int  70 75 80 85
## $ chemistry: int  60 70 85 70


## Import Excel Files
## Use XLConnect Package

file <- file.path("data","05Sample.xlsx")
install.packages("XLConnect")
library(XLConnect)
my.data <- readWorksheetFromFile(file,
                                 sheet=1,
                                 startRow=2)
str(my.data)



## Import Other File Types, Use Foreign Package
## SPSS, Stata, Minitab, SAS

## Built-In Data Sets
## Many packages contain datasets 
## Can be used in 
## Learning
## Testing
## library(package)
## data(dataset)

library(datasets)
data(package="datasets")
data(iris)
str(iris)

## Results:

## 'data.frame':	150 obs. of  5 variables:
## $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
## $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
## $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
## $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
## $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...


## Import from Database

## General Packages for Relational Databases:
## RODBC: can be used for Microsoft SQL Server, MySQL, Access
## DBI: unified syntaxes for a range of DB systems

## Package - RMySQL for MySQL
## Oracle - ROracle
## PostgreSQL -RPostgresQL
## SQLite - RSQLite

## NoSQL DBs
## MongoDB > RMongoDB, RMongo
## Casssandra > rCassandra
## CouchDB > R4CouchDB
## HBase (Hadoop Ecosystem) > rhbase (RHadoop)



## To import data using RODBC Package: 
## Configure a ODBC DSN (Data Source Name)
## DSN is the name of the ODBC connection
## MySQL ODBC for Windows: http://bit.ly/odbcdsnwindows

install.packages("RODBC")
library(RODBC)
connect <- odbcConnect("mysqlconnection") ## DSN Name = "mysqlconnection" on machine/server
my.data <- sqlQuery(connect,"SELECT * FROM test.classroom")
my.data










