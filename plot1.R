# Read data into R.

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";")

setwd("./ExData_Plotting1")

library(lubridate)
library(dplyr)

# Subset the data to only include the dates 2007-02-01 and 2007-02-02. 

sub_data <- filter(data, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")

# Create histogram of Global Active Power

hist(as.numeric(as.character(sub_data$Global_active_power)), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy histogram to a PNG file

dev.copy(png, file= "plot1.png")

# Close PNG device

dev.off()