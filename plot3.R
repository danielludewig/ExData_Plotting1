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

# Plot x versus Sub_metering_1, and add lines for Sub_metering_2 and 
# Sub_metering_3. 

plot(x, as.numeric(as.character(sub_data$Sub_metering_1)), type = "l", 
     col = "black", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7)

lines(x, as.numeric(as.character(sub_data$Sub_metering_2)), type = "l", 
      col = "red")

lines(x, as.numeric(as.character(sub_data$Sub_metering_3)), type = "l", 
      col = "blue")

# Add legend to topright. 

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
            "Sub_metering_3"), cex = 0.7)

# Copy histogram to a PNG file

dev.copy(png, file= "plot3.png")

# Close PNG device

dev.off()
