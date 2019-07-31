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

plot(file$DateTime,file$Global_active_power,type="line",xlab="",ylab="Global Active Power (kilowatts)")