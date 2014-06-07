data <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep = ";")
data1 <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]


png(filename="plot1.png", width=480, height=480, bg="transparent")
hist(data1$Global_active_power, main="Global Active Power",
	col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency" )
dev.off()