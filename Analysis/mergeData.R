## PREP THE DATA FOR THE MERGE AND MERGE THE DATA

## CHECK CAPABILITY FOR CONVERTING THE 'Ranking' ROW IN grossDomProduct FOR 
## NUMERIC CONVERSION
suppressWarnings(as.numeric(grossDomProduct$Ranking))
## RESULTS:
## [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23
## [24]  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46
## [47]  47  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69
## [70]  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90  91  92
## [93]  93  94  95  96  97  98  99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115
## [116] 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138
## [139] 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161
## [162] 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 178 180 181 182 183 184
## [185] 185 186 187 188 189 190
## ALL ROWS READY FOR CONVERSION

## CONVERT RANKINGS
grossDomProduct$Ranking <- as.numeric(grossDomProduct$Ranking)

## CHECK FOR INCOMPATIBLE ROWS IN 'GrossDomesticProduct' IN grossDomProduct
suppressWarnings(as.numeric(grossDomProduct$GrossDomesticProduct))
## RESULTS:
##   [1]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [24]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [47]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [70]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [93]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [116]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [139]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
## [162]  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA 917 822 787 767 767 713 684 596 480 472
## [185] 326 263 228 182 175  40

## DIAGNOSE PROBLEM WITH THE COLUMN
head(grossDomProduct$GrossDomesticProduct)
## RESULTS:
## [1] " 16,244,600 " " 8,227,103 "  " 5,959,718 "  " 3,428,131 "  " 2,612,878 "  " 2,471,784 "
## WE HAVE COMMAS AND SPACES THAT NEED TO BE SUBSTITUDED TO NULL BEFORE WE CAN CONVERT

## CHECK FOR INCOMPATIBLE ROWS IF WE CONVERT COMMA TO NULL
suppressWarnings(as.numeric(",","",grossDomProduct$GrossDomesticProduct))
## RESULTS:
## [1] NA
## COMMA ALONE ISN'T ENOUGH FOR CONVERSION, NEED TO SUBSTITUDE BOTH COMMAS AND SPACES TO NULL

## SUB COMMAS TO NULL
grossDomProduct$GrossDomesticProduct<-gsub(',','',grossDomProduct$GrossDomesticProduct)

## SUB BLANK CHARACTERS TO NULL
grossDomProduct$GrossDomesticProduct<-gsub(' ','',grossDomProduct$GrossDomesticProduct)

## CONFIRM SUBSTITUTION
head(grossDomProduct$GrossDomesticProduct)
## RESULTS:
## [1] "16244600" "8227103"  "5959718"  "3428131"  "2612878"  "2471784" 

## SECOND CHECK FOR INCOMPATIBLE ROWS IN GROSS DOMESTIC PRODUCT
suppressWarnings(as.numeric(grossDomProduct$GrossDomesticProduct))
## RESULTS:
## [1] 16244600  8227103  5959718  3428131  2612878  2471784  2252664  2014775  2014670  1841710
## [11]  1821424  1532408  1322965  1178126  1129598   878043   789257   770555   711050   631173
## [21]   523806   514060   499667   489795   483262   475502   394708   384313   381286   369606
## [31]   365966   348595   314887   305033   274701   269869   263259   262832   262597   258217
## [41]   250182   249099   247546   225143   212274   210771   210280   205789   203790   203521
## [51]   196446   192711   176309   171476   167347   160913   155820   124600   116355   114147
## [61]   101496    95982    91149    84040    73672    69972    68234    66605    63267    59423
## [71]    59228    59047    58769    55178    51113    50972    50234    49920    45662    45279
## [81]    45104    43582    42945    42344    41605    40711    40697    37489    36253    35646
## [91]    35164    31015    29044    28373    28242    27035    25502    25322    24680    23864
## [101]    23320    22767    22390    20678    20497    19881    18963    18434    18377    17697
## [111]    17466    17204    16954    15747    15654    14755    14504    14244    14046    14038
## [121]    13678    13579    13072    12887    12648    10507    10486    10441    10308    10271
## [131]    10220     9975     9951     9802     9613     9418     8722     8149     7843     7557
## [141]     7253     7103     6972     6773     6475     6445     6075     5632     5474     5012
## [151]     4373     4264     4225     4199     3908     3814     3796     3744     3092     2851
## [161]     2584     2472     2448     2222     2184     1827     1780     1734     1493     1293
## [171]     1239     1134     1129     1008      917      822      787      767      767      713
## [181]      684      596      480      472      326      263      228      182      175       40
## ALL ROWS READY FOR CONVERSION

## CONVERT TO NUMERIC
grossDomProduct$GrossDomesticProduct<-(as.numeric(grossDomProduct$GrossDomesticProduct))

## FINAL CHECK FOR CLEAN AND NUMERIC DATA BEFORE MERGE
head(grossDomProduct$GrossDomesticProduct)
## RESULTS: 
## [1] "16244600" "8227103"  "5959718"  "3428131"  "2612878"  "2471784" 

checkBadValues(grossDomProduct)
## RESULTS:
##                      countNA countBlank countElipse
## CountryCode                0          0           0
## Ranking                    0          0           0
## LongName                   0          0           0
## GrossDomesticProduct       0          0           0
## CONVERSIONS SUCCESSFUL! READY FOR MERGE

## MERGE GROSS DOMESTIC PRODUCT AND EDUCATION DATA
productAndEducation <- merge(grossDomProduct, educationData, by="CountryCode", all=FALSE)

## CHECK FOR ERRORS IN MERGED DATA AND GET A SUMMARY
summary(productAndEducation)
str(productAndEducation)
checkBadValues(productAndEducation)
## RESULTS:
##                      countNA countBlank countElipse
## CountryCode                0          0           0
## Ranking                    0          0           0
## LongName                   0          0           0
## GrossDomesticProduct       0          0           0
## Long.Name                  0          0           0
## Income.Group               0          0           0
## Short.Name                 0          0           0

## DATA HAS SUCCESSFULLY MERGED WITH THE MEANS TO CONTINUE ANALYSIS