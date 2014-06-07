data <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep = ";")
data1 <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

cols <- c("Date","Time")
data1$DateTime <- apply(data1[, cols], 1, paste, collapse = " " )
data1[, "DateTime"] <- as.POSIXct(strptime(data1[,"DateTime"], format="%Y-%m-%d %H:%M:%S"))

png(filename="plot4.png", width=480, height=480, bg="transparent")

par(mfrow=c(2, 2), mar=c(4, 4, 4, 4))

plot(data1$DateTime, data1$Global_active_power, type="l", 
	ylab="Global Active Power", xlab="", col="black")

plot(data1$DateTime, data1$Voltage, type="l", 
	ylab="Voltage", xlab="datetime", col="black")

plot(data1$DateTime, data1$Sub_metering_1, type="l", 
	ylab="Energy sub metering", xlab="", col="black")
lines(data1$DateTime, data1$Sub_metering_2, col="red")
lines(data1$DateTime, data1$Sub_metering_3, col="blue")
legend("topright", bty="n", cex=0.8, col=c("black","red", "blue"), 
lty=c(1, 1, 1), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(data1$DateTime, data1$Global_reactive_power,type="l",
	ylab="Global_reactive_power", xlab="datetime", col="black")

dev.off()