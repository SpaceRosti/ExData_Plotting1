library(lubridate)
data<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors = FALSE,header = TRUE)#read data

data$Date<-dmy(data$Date)#convert to date format

subdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")#keep dates 2007-02-01 and 2007-02-02

hist(ok$Global_active_power,col = "red",main= "Global Active Power",xlab= "Global Active Power(kilowatts)",ylab="Frequency")#make the plot

dev.copy(png,file = "plot1.png")#create the png file
dev.off()