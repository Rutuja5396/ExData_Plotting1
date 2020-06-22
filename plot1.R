#reading the data file
mydata <- read.delim('household_power_consumption.txt', header= TRUE, sep = ";")
filt_data <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')
#plotting histogram of global active power
globalact <- as.numeric(filt_data$Global_active_power)
png(filename= "plot1.png")
hist(globalact, col ="red", main =" Global active power")
dev.off()
