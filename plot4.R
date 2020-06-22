#reading the data file
mydata <- read.delim('household_power_consumption.txt', header= TRUE, sep = ";")
filt_data <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')
#subset data
datetime <- strptime(paste(filt_data$Date, filt_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filt_data$Global_active_power)
globalReactivePower <- as.numeric(filt_data$Global_reactive_power)
voltage <- as.numeric(filt_data$Voltage)
subMetering1 <- as.numeric(filt_data$Sub_metering_1)
subMetering2 <- as.numeric(filt_data$Sub_metering_2)
subMetering3 <- as.numeric(filt_data$Sub_metering_3)
#plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
