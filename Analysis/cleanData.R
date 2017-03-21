## CLEANING THE DATA 
## COUNT ALL 'NA'S IN CSVs
countNA <- function(x) {
  count <- vector()
  for (name in names(x)) {
    count<-append(count, sapply(x[name], function(y) sum(length(which(is.na(y)))))) #sums number of Nas for each column
  }
  return(count)
}

## COUNT '..' IN CSVs
countElipse<-function(x){ 
  count <- vector()
  for (name in names(x)) {
    count<-append(count, sapply(x[name], function(y) sum(length(which(is.element('..', y))))))
  }
  return(count)
}

## COUNT BLANK ROWS IN COLUMNS
countBlank<-function(x){ 
  count <- vector()
  for (name in names(x)) {
    count<-append(count, sapply(x[name], function(y) sum(length(which(is.element('', y))))))
  }
  return(count)
}
## FUNCTION TO READ EACH PREVIOUS FUNCTION FOR EASE OF DIAGNOSTICS
checkBadValues <- function(x) {
  countNA <- countNA(x)
  countBlank<-countBlank(x)
  countElipse<-countElipse(x)
  return(data.frame(countNA, countBlank, countElipse))
}
## RUN FUNCTION
checkBadValues(grossDomProduct)
## RESULTS:
##     countNA countBlank countElipse
## V1        0          1           0
## V2        0          1           0
## V3      326          0           0
## V4        0          1           0
## V5        0          1           1
## V6        0          1           0
## V7      326          0           0
## V8      326          0           0
## V9      326          0           0
## V10     326          0           0
## 
## WE NEED TO GET RID OF V3, V6, V7, V8, AND V9

## DELETE SPECIFIED COLUMNS FROM DATA FRAME
grossDomProduct$V3 <- NULL
grossDomProduct$V6 <- NULL
grossDomProduct$V7 <- NULL
grossDomProduct$V8 <- NULL
grossDomProduct$V9 <- NULL
grossDomProduct$V10 <- NULL

## RENAME COLUMNS FROM grossDomProduct TO MATCH THOSE IN educationData AND OTHER RELEVANT NAMES
names(grossDomProduct)[1] <- "CountryCode"
names(grossDomProduct)[2] <- "Ranking"
names(grossDomProduct)[3] <- "LongName"
names(grossDomProduct)[4] <- "GrossDomesticProduct"

## CHECK VALUES FOR educationData
checkBadValues(educationData)
## RESULTS:
## CountryCode                                             0          0           0
## Long.Name                                               0          0           0
## Income.Group                                            0          1           0
## Region                                                  0          1           0
## Lending.category                                        0          1           0
## Other.groups                                            0          1           0
## Currency.Unit                                           0          1           0
## Latest.population.census                                0          1           0
## Latest.household.survey                                 0          1           0
## Special.Notes                                           0          1           0
## National.accounts.base.year                             0          1           0
## National.accounts.reference.year                      197          0           0
## System.of.National.Accounts                           149          0           0
## SNA.price.valuation                                     0          1           0
## Alternative.conversion.factor                           0          1           0
## PPP.survey.year                                        89          0           0
## Balance.of.Payments.Manual.in.use                       0          1           0
## External.debt.Reporting.status                          0          1           0
## System.of.trade                                         0          1           0
## Government.Accounting.concept                           0          1           0
## IMF.data.dissemination.standard                         0          1           0
## Source.of.most.recent.Income.and.expenditure.data       0          1           0
## Vital.registration.complete                             0          1           0
## Latest.agricultural.census                              0          1           0
## Latest.industrial.data                                139          0           0
## Latest.trade.data                                      46          0           0
## Latest.water.withdrawal.data                           82          0           0
## X2.alpha.code                                           1          1           0
## WB.2.code                                               1          1           0
## Table.Name                                              0          0           0
## Short.Name                                              0          0           0

## KEEP ONLY COLUMNS WE NEED:
educationData<-educationData[c(1,2,3,31)]
## CHECK TO MAKE SURE PROPER COLUMNS ARE STILL AVAILABLE:
names(educationData)
## RESULTS:
## [1] "CountryCode"  "Long.Name"    "Income.Group" "Short.Name"  

## SECOND CHECK FOR VALID COLUMNS AND ROWS
checkBadValues(grossDomProduct)
## RESULTS:
##                      countNA countBlank countElipse
## CountryCode                0          1           0
## Ranking                    0          1           0
## LongName                   0          1           0
## GrossDomesticProduct       0          1           1
## BLANKS AND ELIPSE MAY BE THE RESULT OF EXCESS ROWS

checkBadValues(educationData)
## RESULTS:
##              countNA countBlank countElipse
## CountryCode        0          0           0
## Long.Name          0          0           0
## Income.Group       0          1           0
## Short.Name         0          0           0
## BLANK ROW IN Income.Group IS OK AS IT IS NON-NUMERIC

## CLIP EXCESS ROWS IN grossDomProduct
grossDomProduct <- grossDomProduct[-c(191:330),]

## FINAL CHECK FOR CLEAN DATA
checkBadValues(grossDomProduct)
## RESULTS:
##                      countNA countBlank countElipse
## CountryCode                0          0           0
## Ranking                    0          0           0
## LongName                   0          0           0
## GrossDomesticProduct       0          0           0

## DATA HAS BEEN CLEANED!