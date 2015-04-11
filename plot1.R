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

# Creating plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

