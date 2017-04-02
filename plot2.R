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

# Plot x verse the global active power, and specify type "l".

plot(x, as.numeric(as.character(sub_data$Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatt)")

# Copy histogram to a PNG file

dev.copy(png, file= "plot2.png")

# Close PNG device

dev.off()
