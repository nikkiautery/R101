## This data is NOT from the COURSE on PluralSight as the course data was corrupt
## This is an attempt to complete the course with different data.

## Convert from character string to factor; use quotes for columns that contain spaces
## Not using quotes can cause problems.


supermarket_sales_Sheet1$'Branch' =  as.factor(supermarket_sales_Sheet1$'Branch')
supermarket_sales_Sheet1$'Customer type' = as.factor(supermarket_sales_Sheet1$
                                                         'Customer type')
supermarket_sales_Sheet1$'Gender' = as.factor(supermarket_sales_Sheet1$'Gender')
supermarket_sales_Sheet1$'Product line' = as.factor(supermarket_sales_Sheet1$
                                                        'Product line')
supermarket_sales_Sheet1$'City' = as.factor(supermarket_sales_Sheet1$'City')

head(supermarket_sales_Sheet1)

## Factors, or categorial variables, support analytic methods which are not
## supported by character values.

## Updating/Overwriting Objects
## You make an update to an object when you change it, which is usually an
## improvement.
## Analyzing faulty data leads to faulty results
## Keeping up with updates and new objects can be confusing.

x <- c("Nikki","Will","Michelle","Michael")
as.factor(x) ## Updates as a factor
str(x)

## Restoring from a factor from character vector is limited

a <- c("Donny", "Bill","Fred","Frank")
a <- as.factor(a)
a

## Working with column names: they're for orientation in a table
## Short, informative, no spaces, and consistent casing

## Common operations:
## Extracting available columns, renaming existing columns.

names(supermarket_sales_Sheet1)

## R Base Method: Rename the Whole Header
## Dplyer Method: More targetted approach

## R Base Method:
## Access the header as one object with function names()
names(supermarket_sales_Sheet1)
## Use a character vector for the new header

mydf <- supermarket_sales_Sheet1[,c(1,2,3)]
head(mydf)
newnames <- c("INVOICE", "STORE", "LOCATION")
names(mydf) <- newnames
head(mydf)


## Renaming Columns with dplyr
## Rename a subset of column headers
## Access column names iteratively with function rename()
## new_name = 'old_name'
## Do not use already-used column header names or R keywords.
## e.g. date = DATE

library(dplyr)

supermarket_sales_Sheet1 = rename(supermarket_sales_Sheet1,
                                  CUSTOMERTYPE = "Customer type",
                                  PRODUCTLINE = "Product line",
                                  PRICE = "Unit price",
                                  INVOICE = "Invoice ID")

supermarket_sales_Sheet1 = rename(supermarket_sales_Sheet1,
                                  STORE = "Branch",
                                  LOCATION = "City",
                                  GENDER = "Gender",
                                  QUANTITY = "Quantity",
                                  TAX = "Tax 5%",
                                  GROSS = "gross margin percentage",
                                  INCOME = "gross income",
                                  RATING = "Rating")

supermarket_sales_Sheet1 = rename(supermarket_sales_Sheet1,
                                  TOTAL = "Total",
                                  TRANSDATE = "Date",
                                  TRANSTIME = "Time",
                                  METHOD = "Payment",
                                  COGS = "cogs")

head(supermarket_sales_Sheet1)
## Much easier to code with these column headers...

## Know the structure, data types, the amount of data, and missing values or outliers

head(supermarket_sales_Sheet1)  ## Dispays the top 6 rows of data
tail(supermarket_sales_Sheet1)  ## Displays the bottom 6 rows of data
tail(supermarket_sales_Sheet1, 10) ## View the last 10 rows

## When using tail(), be aware of whether the data frame has invalid/incomplete
## data in the last few rows; this is not uncommon

glimpse(supermarket_sales_Sheet1)

summary(supermarket_sales_Sheet1)
typeof(supermarket_sales_Sheet1)
str(supermarket_sales_Sheet1)
summary(as.integer(supermarket_sales_Sheet1$QUANTITY))

install.packages(skimr)
library(skimr)
skim(supermarket_sales_Sheet1)

## Contingency Tables for Factors
## A table built on cross-classification of factors (also known as crosstab) 
## that consists of counts for each combination of factors.

## table() function creates a crosstab featuring the variables of one or two
## groups.

table(supermarket_sales_Sheet1$PRODUCTLINE)
prop.table(table(supermarket_sales_Sheet1$PRODUCTLINE))

## Creating a crosstab 
table(supermarket_sales_Sheet1$PRODUCTLINE, supermarket_sales_Sheet1$STORE)
mytable = table(supermarket_sales_Sheet1$PRODUCTLINE, 
                supermarket_sales_Sheet1$STORE)
mytable
rowSums(mytable) ## Marginal total per row
colSums(mytable) ## Marginal total per column

prop.table(mytable) ## Get percentages per Product Line and per Store.

## Round to 5 decimal values, multiplying by 100 sets to percentage scale
round(prop.table(mytable), 5) * 100  

## Checking the dependency of variables

chisq.test(supermarket_sales_Sheet1$PRODUCTLINE, supermarket_sales_Sheet1$STORE)
## Results: X-squared = 11.559, df = 10, p-value = 0.3156 
## The Pearson's chi squared test 
## Null Hypothesis: Independence - p-value > 0.05
## Alternative hypothesis: Dependence - p-value < 0.05

## Visual Data Exploration

## Histogram, Box Plot, Bar Chart/Plot, Scatter Plot are 4 common types.
## Popular library: ggplot 2, but the syntax doesn't align with standard R code
## Beginners should start out with R Base plots

## Histogram: used on numeric or integer data to display the statistical 
## distribution of data. Reveals the most likely values of a vector.
## Bin: the width on the X axis combined into one unit; its size is calculated
## automatically. It can be set manually, however, with the "breaks" argument.

hist(supermarket_sales_Sheet1$PRICE)
## Good for testing for normal distribution; bell curve.

## Bar Chart: Looks similar to a histogram, but the underlying data type is 
## different. The Bar Chart works on factors (grouping variables) to show how
## many observations per group.

## Using Plot() will select the best representation (plot) for the data type

plot(supermarket_sales_Sheet1$PRODUCTLINE)
plot(supermarket_sales_Sheet1$GENDER)
plot(supermarket_sales_Sheet1$CUSTOMERTYPE)
plot(supermarket_sales_Sheet1$STORE)

## Statistical Distribution: BOX PLOT
## Data: a measurement (integer or numeric) and a grouping variable (factor)
## Constructing a box plot: formula (MeasureVar ~ GroupingVar, data = data, las = n)
## Introduce multiple variables using the formula argument ~ (tilde)
## Left Side is always the measure variable, the right side is always the group
## las = 2 shows the names on the X-AXIS without being condensed/left off for
## space. 

boxplot(TOTAL ~ PRODUCTLINE, data = supermarket_sales_Sheet1, las = 2)

## The Scatter Plot: data includes two numeric variables; this plot shows 
## correlation between two variables.

plot(supermarket_sales_Sheet1$QUANTITY, supermarket_sales_Sheet1$TOTAL)
plot(supermarket_sales_Sheet1$TAX, supermarket_sales_Sheet1$TOTAL)
plot(supermarket_sales_Sheet1$COGS, supermarket_sales_Sheet1$TOTAL)

## MISSING DATA: NA, corrupts analysis quality or prevents functions from work-
## ing. 

is.na(supermarket_sales_Sheet1)
## There are NO NA values in this dataframe.

## Visdat package can be used to visually determine missing data; 
## vis_dat() visual representation of data types and missing values by color
## vis_miss() shows the proportion of missing values
library(visdat)
vis_dat(supermarket_sales_Sheet1)
vis_miss(supermarket_sales_Sheet1)

supermarket_sales_Sheet1 = na.omit(supermarket_sales_Sheet1)  ## Omit NA values
supermarket_sales_Sheet1
## na.omit() is good to use if NA values represent only a small number in a 
## large dataset

## Missing data imputation: 
## The replacement can range from simple to very complex.
## SIMPLE: Replaces NA values with plausible data value. 
## Mean, median, or the last value that exists before the missing value.
## COMPLEX: Logically weighted regressions (e.g. MICE - MULTIPLE IMPUTATION with
## CHAINED EQUATIONS)

## Making changes to a dataframe

## Simplifying the grouping variables for efficiency.
 ## Factors - shorten & simplify to split text-based columns
 ## Remove unnecessary columns
 ## Add new columns from external sources with joins 
## Variable transformation to produce columns based on a calculation from exist-
## ing variables; adjusting revenue by taxes or COGs.
## Aggregate statistics to dive deeper into the dataset and gain more information

## Splitting strings:
## In some cases, you may want to split text data - names into First and Last, etc.
## Detect patterns throughout the column to be changed.
## The patterns should be consistent throughout the columns; it's much easier
## If the patterns are different/no pattern, it is much harder.

## Use tidyr
library(tidyr)

## The dataset I am using does not have any good data for performing this task;
## the examples included are from the course, which - again - the exercise files
## were malicious or corrupt and blocked from being downloaded.

separate(lures,
         col = 1,
         into = c("SHOP", "R"),  ## "R" stands for "The Rest", ie. the numbers that were separated OUT and can be deleted
         sep = 4)

separate(lures,
         col = 3,
         into = c("RR", "PERSON"),
         sep = "-") ## the Sales person ID is HF-NP429, therefore, the split will occur where the "-" is.

## NOTE: when splitting data, make sure that the into = matches with how you want
## the data represented. R, RR, etc. can be used for "the rest" which will tell
## you that the data is not necessary - and depending on the position of the data
## that you want to split off, the R or RR or whatever you choose to call the 
## new column should be aligned with the data you don't necessarily need (or, if
## you do need it, name the column something relevant, but make sure it still 
## aligns with the way you've indicated your columns should be split via the 
## into = c("Column1", "column2"))... you can create as many columns as necess-
## ary or required. The column names must be unique.

## The structure is as follows:
## separate(datasetname,
##          column to be split,
##          the columns that will be created from the split,
##          where the separation should occur)


## Adding and Removing Columns
## Remove unnecessary columns, generate a dataset of selected columns, fuse two
## datasets into one dataset.

## Due to my data not matching and not having any irrelvant data, I'm going
## to remove the TIME column.

## I will create a new column from TOTAL and COGs to generate a per-sale revenue 
## column.

## I will fuse location and store

## dataframe[rows, columns] - using the indexing operator: keep selected columns
## by specifying their index position at the right side of the comma.

## Perform the task by Subsetting with the indexing operator
## [rows, columns]
## By subsetting and creating a new dataframe, the original dataframe remains
## unchanged.

supermarket_sales <- supermarket_sales_Sheet1[, c(1:11, 13:17)]
head(supermarket_sales)

## Or, perform the task by removing the undesired column(s)
## Performing this task on the original dataframe is PERMANENT

supermarket_sales_Sheet1 = supermarket_sales_Sheet1[, -c(12)]
head(supermarket_sales_Sheet1)

## Combine columns with cbind
## Combine rows with rbind

supermarket_sales = cbind(supermarket_sales_Sheet1, supermarket_sales)
head(supermarket_sales)
## the above adds duplicate sheet! Not a good example... 

## Adding an External Variable to a table.
## Merging two tables or extending a table with further variables/information
## Join: merging two tables based on one or more common variable(s), keys
head(supermarket_sales)
summary(supermarket_sales)
typeof(supermarket_sales)
supermarket_sales

## Make sure all data in the new dataframe are categoriezed correctly; if not
## re-run the as.factor() function where necessary.

## For JOIN to work, the key column must be named the SAME NAME as the column
## in the original data set. 

## The order of the values also matters.

supermarket_sales <- merge(supermarket_sales_Sheet1, customerdata, by = "INVOICE")
sales_by_customer <- supermarket_sales
sales_by_customer

## PRODUCLT LINES have varying shipping costs; to add a column with the shipping
## cost:

PRODUCTLINE <- levels(sales_by_customer$PRODUCTLINE) ## returns the number of product lines 
SHIPCOST <- c(0.01, 0.02, 0.03, 0.04, 0.05, 0.06) ## create a vector of shipping cost based on % of sale

mydata <- data.frame(PRODUCTLINE,SHIPCOST) ## Create a dataframe based on the product line and shipping cost

sales_by_customer <- merge(sales_by_customer, mydata, by = "PRODUCTLINE") 
## add the shipping cost column to the sales_by_customer dataframe using merge.

## Variable Transformation

## Deriving variables from existing ones
## Converting units
## Using the mutate() function from dplyr calculates new variables while keeping
## the base variables.
## Scoped versions: mutate_all, mutate_if, mutate_at
## Removing variable: variable = NULL
## transmute() function calculates new variables while dropping the base variables

library(dplyr)

## In this effort, I will create a new column to update the total with the new
## shipping cost. It will be ADJ_TOTAL (to include the shipping of items)

sales_by_customer <- mutate(sales_by_customer, ADJ_TOTAL = ((TOTAL * SHIPCOST)+(TOTAL))) 
## it worked :)

## Aggregate Statistics
## Summarizing a dataset based on a given scope (whole table or factor) and by
## a given aggregation (e.g. mean, median)
## Aggregating by factor is preferred, but also require numeric variables to
## summarize.

## What is the average ADJ_TOTAL per store? Per Customer? Per Location?

## Good tools include: aggregate() from R Base, dplyr, data.table
## data.table is easy to query and fast.
library(data.table)

sales_by_customer <- data.table(sales_by_customer)

## data.table() query Syntax:
## i - subset (rows) to be extracted based on a condition
## j - calculation to be performed on the subset
## by - grouping parameter that serves as a base for aggregation

## Find the average revenue (TOTAL) by product line

## [i, j, by] = [critera, calculation, group]

## Summaries; [j, by]
sales_by_customer[, mean(TOTAL), by = PRODUCTLINE] 
## leaving the criteria blank returns all criteria

## Find the average revenue by product line per location:
x <- sales_by_customer[ , round(mean(TOTAL), 1),
                        by = list(PRODUCTLINE, LOCATION)]
x


## Find the average revenue where quantities purchased were greater than 2, per
## product line, per location

y <- sales_by_customer[QUANTITY > 2, round(mean(TOTAL), 1),
                        by = list(PRODUCTLINE, LOCATION)]
y


## Using logical operators to query 

## use  & | ! to connect to or more statements (parameter i);
## use the count operator (.N) to learn the frequency of an event (parameter j)

## How many transactions of quantities of 2+, with a TOTAL less than 100 occured
## by product line, per location?

z <- sales_by_customer[QUANTITY > 2 & ADJ_TOTAL < 100, .N,
                       by = list(PRODUCTLINE, LOCATION)]
z

## How many transactions of quantities of 2+, with a TOTAL greater than 100 occured
## by product line, per location?

a <- z <- sales_by_customer[QUANTITY > 2 & ADJ_TOTAL > 100, .N,
                            by = list(PRODUCTLINE, LOCATION)]
a

## Exporting Clean Data:

## Pepared Data to CSV using write.csv() --> setwd() to store the file in.
getwd()
write.csv(sales_by_customer, "myexport.csv")
