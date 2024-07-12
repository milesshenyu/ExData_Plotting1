#Reading and subsetting
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007")]

#Plotting and saving as PNG file
png(filename = "plot3.png", width = 480, height = 480)

plot(data$Datetime, data[, 7], xlab = "", ylab = "Energy sub metering",
     type = "l", xaxt = "n")
lines(data$Datetime, data[, 8], col = "red")
lines(data$Datetime, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

axis.POSIXct(1, format="%a")

dev.off()