# This function makes plot2.png

data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)  # Reads csv file into data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")          # Converts Date column to date format
indx <- which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))  # Selects data for particular dates
global <- data$Global_active_power[indx]                       
global[global == "?"] <- "NA"                             # Converts "?" to NA
global <- as.numeric(global)                              # Converts to numeric values
dateTime <- strptime( paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")  # Converts to POSIXlt

# Plotting data
plot(dateTime[indx], global, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()