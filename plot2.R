# Read all data
hpcData<-read.table('./household_power_consumption.txt', sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Subset data for 2007 Feb 1 & 2
hpcSubset<-hpcData[hpcData$Date %in% c("2/2/2007","1/2/2007"),]

#Pull data to chart 
time <- strptime(paste(hpcSubset$Date, hpcSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower<-hpcSubset$Global_active_power

#Output to screen to see how it looks
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Create png output
png("plot2.png", width=480, height=480)
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()