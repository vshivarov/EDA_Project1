## The work directory is set first where the unzipped .txt file is stored
setwd("C:/Users/x/Desktop/Coursera")
## The .txt file is read as a data frame in R
dfrm1<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
## Convert the first column of the dataframe into Date format
dates<-as.Date(dfrm1[,1],format="%d/%m/%Y")
## Overwrite the first column of the dfrm1 in the Date format
dfrm1$Date<-dates
## Define the dates that we are interested in as a vector of 2 dates
seldates<-as.Date(c("2007-02-01","2007-02-02"))
## Subset the dataframe based on the dates we are interested in
dfrm2<-subset(dfrm1, subset=(dfrm1$Date%in%seldates))
## Open the png device and define the plot
png(filename ="Rplot1.png",width = 480, height = 480, units = "px")
## Draw the plot in the png device
hist(na.omit(as.numeric(dfrm2[,3])), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
## Close the png device
dev.off()
