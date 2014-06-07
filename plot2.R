data <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep = ";")
data1 <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

cols <- c("Date","Time")
data1$DateTime <- apply(data1[, cols], 1, paste, collapse = " " )
data1[, "DateTime"] <- as.POSIXct(strptime(data1[,"DateTime"], format="%Y-%m-%d %H:%M:%S"))

png(filename="plot2.png", width=480, height=480, bg="transparent")

plot(data1$DateTime, data1$Global_active_power, type="l",
ylab="Global Active Power (kilowatts)", xlab="")

dev.off()