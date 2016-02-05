# Read all data
hpcData<-read.table('./household_power_consumption.txt', sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Subset data for 2007 Feb 1 & 2
hpcSubset<-hpcData[hpcData$Date %in% c("2/2/2007","1/2/2007"),]

#Pull data to chart 
time <- strptime(paste(hpcSubset$Date, hpcSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower<-hpcSubset$Global_active_power
voltage<-hpcSubset$Voltage
subMetering1<-hpcSubset$Sub_metering_1
subMetering2<-hpcSubset$Sub_metering_2
subMetering3<-hpcSubset$Sub_metering_3
globalReactivePower<-hpcSubset$Global_reactive_power

#Output to screen to see how it looks
par(mfrow=c(2,2))
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(time, voltage, type="l", xlab="datatime", ylab="Voltage")
plot(time, subMetering1, type="l", xlab="", col="black", ylab="Energy sub metering")
lines(time, subMetering2, type="l", xlab="", col="red")
lines(time, subMetering3, type="l", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
plot(time, globalReactivePower, type="l", xlab="datatime", ylab="Global_reactive_power")

#Create png output
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(time, globalActivePower, type="l", ylab="Global Active Power")
plot(time, voltage, type="l", ylab="Voltage")
plot(time, subMetering1, type="l", xlab="", col="black", ylab="Energy sub metering")
lines(time, subMetering2, type="l", xlab="", col="red")
lines(time, subMetering3, type="l", xlab="", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
plot(time, globalReactivePower, type="l", ylab="Global_reactive_power")
dev.off()