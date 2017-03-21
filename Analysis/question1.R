##### QUESTION ONE:Merge the data based on the country shortcode. How many of the IDs match? 
##### I USED THE NAME "CountryCode" TO DEFINE THE FIRST ROW OF "grossDomProduct" DATA FRAME 
##### IN ORDER TO MATCH THE 'SHORT CODE' FROM BOTH DATA FRAMES AND MERGE ONTO IT
## CHECK INITIAL LENGTH BEFORE MERGE IN grossDomProduct
length(grossDomProduct$CountryCode)
## RESULTS:
## [1] 190

## CHECK INITIAL LENGTH BEFORE MERGE IN educationData
length(educationData$CountryCode)
## RESULTS:
## [1] 234

## CHECK LENGTH POST MERGE
length((productAndEducation$CountryCode))
## RESULTS:
## [1] 189
#### THE ANSWER TO QUESTION ONE IS OUT OF THE 190 COUNTRY CODE IDs IN grossDomProduct
#### AND THE 234 COUNTRY CODE IDs IN educationData, THERE ARE 189 MATCHES