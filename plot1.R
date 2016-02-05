# Read all data
hpcData<-read.table('./household_power_consumption.txt', sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Subset data for 2007 Feb 1 & 2
hpcSubset<-hpcData[hpcData$Date %in% c("2/2/2007","1/2/2007"),]

#Pull data to chart 
globalActivePower<-hpcSubset$Global_active_power

#Output to screen to see how it looks
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Create png output
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()