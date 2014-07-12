# This function makes plot1.png

data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)  # Reads csv file into data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")          # Converts Date column to date format
indx <- which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))  # Selects data for particular dates
global <- data$Global_active_power[indx]                       
global[global == "?"] <- "NA"                             # Converts "?" to NA
global <- as.numeric(global)                              # Converts to numeric values

# Plotting data
hist(global, xlab = "Global Active Power (kilowatts)", col = 2)
dev.copy(png, file = "plot1.png")
dev.off()
