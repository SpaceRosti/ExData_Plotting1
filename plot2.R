library(lubridate)
data<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors = FALSE,header = TRUE)#read data

data$Date<-dmy(data$Date)#convert to date format

subdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")#keep dates 2007-02-01 and 2007-02-02

subdata$DateTime<-paste(as.character(subdata$Date),subdata$Time)#add a new column with the date and the time

subdata$DateTime<-ymd_hms(subdata$DateTime)

plot(subdata$DateTime,subdata$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab = "")

dev.copy(png,file = "plot2.png")#create the png file
dev.off()
