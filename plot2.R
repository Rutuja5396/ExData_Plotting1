#reading the data file
mydata <- read.delim('household_power_consumption.txt', header= TRUE, sep = ";")
filt_data <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')
#str(subSetData)
datetime <- strptime(paste(filt_data$Date, filt_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActPower <- as.numeric(filt_data$Global_active_power)
#plotting the figure
png("plot2.png")
plot(datetime, globalActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
