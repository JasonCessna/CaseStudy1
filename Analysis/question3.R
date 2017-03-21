#### QUESTION THREE: What are the average GDP rankings for the "High income: OECD" 
#### and "High income:nonOECD" groups?

## FIND THE MEAN OF RANKS IN THE DATA FRAME IF THE INCOME GROUP EQUALS 'HIGH INCOME: OECD'
mean(productAndEducation$Ranking[productAndEducation$Income.Group == "High income: OECD"])
## RESULTS:
## [1] 32.96667

## FIND THE MEAN OF RANKS IN THE DATA FRAME IF THE INCOME GROUP EQUALS 'HIGH INCOME: nonOECD'
mean(productAndEducation$Ranking[productAndEducation$Income.Group == "High income: nonOECD"])
## RESULTS: 
## [1] 91.91304

#### THE ANSWER TO QUESTION THREE IS:
#### High income: OECD:    32.97
#### High income: nonOECD: 91.91
