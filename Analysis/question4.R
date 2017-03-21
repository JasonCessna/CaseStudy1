#### QUESTION 4: Show the distribution of GDP value for all the countries and color plots
#### by income group.  Use ggplot2 to create your plot. 

## LOAD LIBRARIES
library(ggplot2)
library(scales)

## CREATE ELEMENT TO HOLD ALL INCOME GROUP NAMES
allIncomeGroups <- unique(productAndEducation[c("Income.Group")])

## CHECK DATA FRAME
allIncomeGroups
## RESULTS:
##             Income.Group
## 173  Lower middle income
## 137  Upper middle income
## 39            Low income
## 1   High income: nonOECD
## 82     High income: OECD

## CREATE GG PLOT
gdpPlot <- ggplot(data = productAndEducation, aes(reorder(CountryCode,GrossDomesticProduct), y=GrossDomesticProduct))
## MAKE SURE THE RESULTS ARE IN MILLIONS OF DOLLARS AND BYPASS SCIENTIFIC NOTATION FOR LEGIBILITY
gdpPlot + geom_point(aes(color = Income.Group)) + labs(title="Gross Domestic Product by Country", y="2012 Gross Domestic Product (by Millions of dollars USD)", x= "Country Code") + scale_y_continuous(labels = comma, breaks=c(1000000,5000000,10000000,15000000))
## RESULTS:
