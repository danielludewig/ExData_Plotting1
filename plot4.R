# Read data into R.

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";")

setwd("./ExData_Plotting1")

library(lubridate)
library(dplyr)

# Subset the data to only include the dates 2007-02-01 and 2007-02-02. 

sub_data <- filter(data, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")

# Extract the dates and times from the subsetted data, convert to POSIXlt format
# and save them to variable x. 

x <- strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")

# Change the global parameter mfrow. 

par(mfrow = c(2,2), mar = c(4,4,2,3), cex.lab = 1)

# Plot 1

plot(x, as.numeric(as.character(sub_data$Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot 2

plot(x, as.numeric(as.character(sub_data$Voltage)), type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3

plot(x, as.numeric(as.character(sub_data$Sub_metering_1)), type = "l", 
     col = "black", xlab = "", ylab = "Energy sub metering")

lines(x, as.numeric(as.character(sub_data$Sub_metering_2)), type = "l", 
      col = "red")

lines(x, as.numeric(as.character(sub_data$Sub_metering_3)), type = "l", 
      col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), cex = 0.6, bty = "n")

# Plot 4

plot(x, as.numeric(as.character(sub_data$Global_reactive_power)), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

# Copy histogram to a PNG file

dev.copy(png, file= "plot4.png")

# Close PNG device

dev.off()