library(datasets)
library(data.table)
setwd("C:/Users/bib1/Documents/RStudio/MyProject/Module4Class1")
fileurl = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('./household_power_consumption.zip')){
  download.file(fileurl,'./household_power_consumption.zip', mode = 'wb')
  unzip("household_power_consumption.zip", exdir = getwd())
}
file<- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses = c("character","character", rep("numeric",7)), na.strings = "?")
file<-subset(file,file$Date=="1/2/2007" | file$Date == "2/2/2007")
file$Date<-as.Date(file$Date, format="%d/%m/%Y")
file$DateTime <- as.POSIXct(paste(file$Date, file$Time))

plot(file$DateTime,file$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")
points(file$DateTime,file$Sub_metering_1,type="line")  
points(file$DateTime,file$Sub_metering_2,type="line",col="red")
points(file$DateTime,file$Sub_metering_3,type="line",col="blue")
legend("topright", col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8,lty = 1,bty = "n")