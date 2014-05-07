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
dfrm2<-dfrm1[dfrm1$Date%in%seldates,]
## Creat a datetime through concatetnation of the date and time columns
dt<-paste(dfrm2[,1],dfrm2[,2])
## Convert the dt vector to class POSIXlt
dt1<-as.POSIXlt(dt)
## Open the png device and define the plot
png(filename ="Rplot3.png",width = 480, height = 480, units = "px")
## Draw the plot in the png device
png(filename ="Rplot4.png",width = 480, height = 480, units = "px")
par(mfcol=c(2,2))
plot(dt1, as.numeric(dfrm2[,3]), type="n", ylab="Global Active Power", xlab="")
lines(dt1, as.numeric(dfrm2[,3]))
plot(dt1, as.numeric(dfrm2[,7]), type="n", ylab="Energy sub metering", xlab="")
lines(dt1, as.numeric(dfrm2[,9]), col="blue")
lines(dt1, as.numeric(dfrm2[,7]), col="black")
lines(dt1, as.numeric(dfrm2[,8]), col="red")
legend("topright", lty=rep("solid",3), col=c("black","red","blue"), c("sub_metering_1","sub_metering_2","sub_metering_3"), bty="n")
plot(dt1, as.numeric(dfrm2[,5]), type="n", ylab="Voltage", xlab="datetime")
lines(dt1, as.numeric(dfrm2[,5]))
plot(dt1, as.numeric(dfrm2[,4]), type="n", ylab="Global_reactive_power", xlab="datetime")
lines(dt1, as.numeric(dfrm2[,4]))
## Close the png device
dev.off()
