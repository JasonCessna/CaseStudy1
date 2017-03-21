#### QUESTION 6: Cut the GDP ranking into 5 separate quantile groups. 
#### Make a table versus Income.Group. How many countries are Lower middle 
#### income but among the 38 nations with highest GDP?

## CREATE 5 QUANTILES IN A NEW DATAFRAME BASED ON GROSS DOMESTIC PRODUCT AND INCLUDE INCOME GROUPS
GDPE <- data.frame(ntile(productAndEducation$GrossDomesticProduct,n=5),productAndEducation$GrossDomesticProduct,productAndEducation$Income.Group)
## NAME DATA FRAME COLUMNS FOR DISPLAY
names(GDPE)<-c("Quantile","GrossDomesticProduct","IncomeGroup")

##CREATE A TABLE WITH QUANTILES VS INCOME GROUPS
xtabs(~GDPE$Quantile+GDPE$IncomeGroup)
## RESULTS:
##              GDPE$IncomeGroup
## GDPE$Quantile    High income: nonOECD High income: OECD Low income Lower middle income
## 1  0                    2                 0         11                  16
## 2  0                    4                 1         16                   9
## 3  0                    8                 1          9                  11
## 4  0                    5                10          1                  14
## 5  0                    4                18          0                   4
## GDPE$IncomeGroup
## GDPE$Quantile Upper middle income
## 1                   9
## 2                   8
## 3                   9
## 4                   8
## 5                  11

#### ANSWER TO QUESITON SIX: There are 16 countries in the lower middle income
#### but the first quantile (top 38 countries) for Gross Domestic Product