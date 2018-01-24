
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

#plot2
png("plot2.png")
plot(fdata$Global_active_power, type= "l", xlab="", ylab= "Global Active Power (kilowatts)", xaxt= "n")
v1 <- seq(0, nrow(fdata), length.out = 3)
v2 <- c("Thu", "Fri", "Sat")
axis(side=1, at= v1, labels= v2)
dev.off()
