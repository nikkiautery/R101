## R Packages

## A collection of different items; functions, data sets, compiled code, documentation
## Used to accomplish specific tasks in specific areas
## Available in some central repositories for download and installation
## Stored in a directory, referred to as a libarary

## To see a list of all packages on local machine, use library()

library()
packages <- installed.packages()
packages
View(packages)

## Loading R Packages
## Installing a package doesn't mean you can just use it right away; it has
## to be loaded in memory first.

## Loacking package = loading package into computer memory
## Makes the package ready to use
## Cannot use a package until it's loaded.

## The fact that R doesn't load packages automatically by default to avoid too
## much memory being consumed resulting in loss of memory and slower computer
## This avoids delay in R booting up
## This avoids unnecessary memory consumption

search()

## Load package using library() function; quotes are not mandatory to use.
## Package names are case-sensitve

library("parallel")
library(parallel)
search()

## Unload or detach a package:
detach(package: parallel, unload = TRUE)
search()

## In Packages TAB, if a checkbox is unchecked, then the package is NOT loaded
## Checking a box loads the package
## Deselecting/unchecking a box unloads/detaches the package for the session

## Load library which is not installed will give an error
library(newpackage) ## will produce error; dummy package

## Use require() function which will return TRUE or FALSE
if(!require("newpackage"))
{
    #download and install package
}
## Result:
## Loading required package: newpackage
## NULL
## Warning message:
##     In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
##                    there is no package called 'newpackage'


## The require() function returns TRUE if the package is already installed; the
## package will then be loaded and attached.
## The require() function returns FALSE if the package is not already installed; 
## and rather than raising an error, a warning will be issued stating the package
## is not able to be loaded.

## Repositories for R Packages; 


## CRAN (Comprehensive R Archive Network)
## CRAN has over 5500 packages
## https://cran.r-project.org
## CRAN Mirrors enables download from geographically closest sources
## https://cran.r-project.org/mirrors.html

## BioConductor | Typically for Bioinformatics

## OmegaHat 

## R-Forge | Packages in development

## rforge.net | Packages in development

## GitHub


## Install an R-Package:

setRepositories()
install.packages("plyr") ## single package
install.packages(c("ggplot2", "randomForest", "RColorBrewer")) ## multiple packages
install.packages("devtools") ## required for installation from GitHub
library(devtools) ## load package
install_github("slidify","ramnathv") ## install packages from github

## Manage Packages

update.packages()
update.packages(ask = FALSE)
remove.packages(insertpackagehere)
remove.packages(c("package1", "package2"))






