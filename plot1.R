#Reading and subsetting
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting and saving as PNG file
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()