
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

#plot3
png("plot3.png")

plot(fdata$Sub_metering_1, xaxt="n", xlab="", ylab="Energy sub metering", col="black", type= "l")
points(fdata$Sub_metering_2, col= "red", type= "l")
points(fdata$Sub_metering_3, col= "blue", type= "l")
axis(side=1, at= v1, labels= v2)
legend("topright", lty=1, legend= paste("Sub","metering", seq(1,3,1), sep="_"), col= c("black","red","blue"))

dev.off()
