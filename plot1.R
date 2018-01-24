

## -------------------------------------------------------------------------------------------------------------------------------------------------------
## download and import
## -------------------------------------------------------------------------------------------------------------------------------------------------------

if (!file.exists("Electric power consumption")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "Electric power consumption.zip")
        unzip("Electric power consumption.zip")
        unlink("Electric power consumption.zip")
} 

require(readr)
require(lubridate)
require(dplyr)


data <- read_delim("household_power_consumption.txt", na= "?", delim= ";")
fdata <- data %>%
        filter(Date== "1/2/2007" | Date== "2/2/2007") %>%
        mutate(Date= dmy(Date))

## -------------------------------------------------------------------------------------------------------------------------------------------------------
## create png
## -------------------------------------------------------------------------------------------------------------------------------------------------------

#plot1
png("plot1.png")

hist(fdata$Global_active_power, main= "Global Active Power", xlab= "Global Active Power (kilowatts)", col= "red")

dev.off()
