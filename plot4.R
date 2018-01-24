
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

#plot4
png("plot4.png")

par(mfrow=c(2,2))
v1 <- seq(0, nrow(fdata), length.out = 3)
v2 <- c("Thu", "Fri", "Sat")

plot(fdata$Global_active_power, type= "l", xlab="", ylab= "Global Active Power", xaxt= "n")
axis(side=1, at= v1, labels= v2)

plot(fdata$Voltage, xaxt="n", xlab="datetime", ylab="Voltage", type= "l")
axis(side=1, at= v1, labels= v2)

plot(fdata$Sub_metering_1, xaxt="n", xlab="", ylab="Energy sub metering", col="black", type= "l")
points(fdata$Sub_metering_2, col= "red", type= "l")
points(fdata$Sub_metering_3, col= "blue", type= "l")
axis(side=1, at= v1, labels= v2)
legend("topright", lty=1, legend= paste("Sub","metering", seq(1,3,1), sep="_"), col= c("black","red","blue"), bty="n")


plot(fdata$Global_reactive_power, xaxt="n", xlab="datetime", ylab="Global_reactive_power", type= "l")
axis(side=1, at= v1, labels= v2)

dev.off()
