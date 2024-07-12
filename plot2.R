#Reading and subsetting
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007")]

#Formatting the time
F_date<- as.Date(data$Date, format = "%d/%m/%Y")
F_time <- strptime(data$Time, format = "%H:%M:%S")
data$Datetime <- as.POSIXct(paste(F_date, data$Time))

#Plotting and saving as PNG file
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Datetime, data$Global_active_power,
     xlab = "", ylab = "Global Power (kilowatts)", type = "l", xaxt = "n")
axis.POSIXct(1, format="%a")
dev.off()