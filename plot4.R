library(lubridate)
data<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors = FALSE,header = TRUE)#read data

data$Date<-dmy(data$Date)#convert to date format

subdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")#keep dates 2007-02-01 and 2007-02-02

subdata$DateTime<-paste(as.character(subdata$Date),subdata$Time)#add a new column with the date and the time

subdata$DateTime<-ymd_hms(subdata$DateTime)

par(mfcol = c(2,2))

plot(subdata$DateTime,subdata$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab = "")

plot(subdata$DateTime,subdata$Sub_metering_1,col ="black",xlab="",ylab = "Energy sub metering",type = "l")
points(subdata$DateTime,subdata$Sub_metering_2,col ="red",type = "l")
points(subdata$DateTime,subdata$Sub_metering_3,col ="blue",type = "l")

legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

plot(subdata$DateTime,subdata$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")

plot(subdata$DateTime,subdata$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")

dev.copy(png,file = "plot4.png")#create the png file
dev.off()