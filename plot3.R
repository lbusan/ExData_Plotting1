# Read all data
hpcData<-read.table('./household_power_consumption.txt', sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Subset data for 2007 Feb 1 & 2
hpcSubset<-hpcData[hpcData$Date %in% c("2/2/2007","1/2/2007"),]

#Pull data to chart 
time <- strptime(paste(hpcSubset$Date, hpcSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1<-hpcSubset$Sub_metering_1
subMetering2<-hpcSubset$Sub_metering_2
subMetering3<-hpcSubset$Sub_metering_3

#Output to screen to see how it looks
plot(time, subMetering1, type="l", xlab="", col="black", ylab="Energy sub metering")
lines(time, subMetering2, type="l", xlab="", col="red")
lines(time, subMetering3, type="l", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

#Create png output
png("plot3.png", width=480, height=480)
plot(time, subMetering1, type="l", xlab="", col="black", ylab="Energy sub metering")
lines(time, subMetering2, type="l", xlab="", col="red")
lines(time, subMetering3, type="l", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()