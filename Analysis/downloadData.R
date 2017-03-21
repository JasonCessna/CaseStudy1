

#IMPORT FILES FROM URL AND READ THEM INTO R AS DATA FRAMES
grossDomProduct<-read.csv('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', header=FALSE, sep=",", stringsAsFactors=FALSE, skip=5)
educationData<-read.csv('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', header=TRUE, sep=",", stringsAsFactors=TRUE)
