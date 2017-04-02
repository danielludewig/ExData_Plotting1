# Read data into R.

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";")

setwd("./ExData_Plotting1")

# Subset the data to only include the dates 2007-02-01 and 2007-02-02. 

sub_data <- filter(data, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")