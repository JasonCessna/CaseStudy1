#### QUESTION 5: Provide summary statistics of GDP by income groups.

## LOAD LIBRARIES
library(dplyr)
library(doBy)

## BEGIN SUMMARY STATISTICS
tapply(productAndEducation$GrossDomesticProduct, productAndEducation$Income.Group, summary)
## RESULTS IN ANSWER BELOW

## GET SPECIFIC STATISTICS
summaryBy(GrossDomesticProduct ~ Income.Group, data = productAndEducation, FUN = function(x) { c(mean = mean(x), stdev = sd(x), sum=sum(x), count=length(x))})
## RESULTS IN ANSWER BELOW:

#### ANSWER TO QUESTION 5:

#### SUMMARY STATISTICS FOR EACH INCOME GROUP:
#### $`High income: nonOECD`
#### Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#### 2584   12840   28370  104300  131200  711000 

#### $`High income: OECD`
#### Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#### 13580   211100   486500  1484000  1480000 16240000 

#### $`Low income`
#### Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#### 596    3814    7843   14410   17200  116400 

#### $`Lower middle income`
#### Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#### 40    2549   24270  256700   81450 8227000 

#### $`Upper middle income`
#### Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#### 228    9613   42940  231800  205800 2253000 

#### 
#### SPECIFIC STATISTICS FOR THE GROUPS:
#### INCOME GROUP           MEAN       STANDARD DEVIATION     SUM       TOTAL(count of countries in group)
#### High income: nonOECD  104349.83        165334.45        2400046      23
#### High income: OECD     1483917.13       3070463.52       44517514     30
#### Low income            14410.78         20473.09         533199       37
#### Lower middle income   256663.48        1139619.92       13859828     54
#### Upper middle income   231847.84        476872.04        10433153     45