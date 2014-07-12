# This function makes plot3.png

data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)  # Reads csv file into data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")          # Converts Date column to date format
indx <- which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))  # Selects data for particular dates

sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

dateTime <- strptime( paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")  # Converts to POSIXlt

# Plotting data
plot(dateTime[indx], sub1[indx], type = "l", ylab = "Energy sub metering", xlab = "", col = 1)
lines(dateTime[indx], sub2[indx], type = "l", ylab = "Energy sub metering", xlab = "", col = 2)
lines(dateTime[indx], sub3[indx], type = "l", ylab = "Energy sub metering", xlab = "", col = 4)
legend("topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       cex = 0.75)
dev.copy(png, file = "plot3.png")
dev.off()