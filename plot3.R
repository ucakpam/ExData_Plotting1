# Creating text file containing data for 1/2/2007 and 2/2/2007 only
system("head -1 household_power_consumption.txt > trimmed_data.txt")
system("grep '^[12]/2/2007' household_power_consumption.txt >> trimmed_data.txt") 

# Reading dataset into a data.frame
consumption <- read.csv("trimmed_data.txt", sep = ";", header = TRUE, na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric", "numeric"))

# Deleting recently-created data file
system("rm trimmed_data.txt")

# Converting dates
datetime <- strptime(paste(consumption$Date,consumption$Time), "%d/%m/%Y %T")

# Creating plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(datetime, consumption$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(datetime, consumption$Sub_metering_2, type = "l", col = "red")
points(datetime, consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red","blue")) 
dev.off()

