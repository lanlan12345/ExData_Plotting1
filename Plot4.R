library(data.table)
library(dplyr)
library(lubridate)
library(grDevices)

elec <- fread("household_power_consumption.txt",na.strings = "?")
# We will only be using data from the
#dates 2007-02-01 and 2007-02-02
elec$Date <- dmy(elec$Date) 
elec <- filter(elec, Date == ymd("2007-02-01") |Date == ymd("2007-02-02") )
datetime <- paste(elec$Date, elec$Time, sep = " ")
datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")
png(file = "Plot4.png", bg = "transparent")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

plot(datetime,elec$Global_active_power,type = "l", ylab = "Global Active Power",xlab = "")

plot(datetime,elec$Voltage,type = "l", ylab = "Voltage",xlab = "datetime")

plot(datetime,elec$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
points(datetime,elec$Sub_metering_2, type = "l", col="red")


points(datetime,elec$Sub_metering_3, type = "l", col="blue")


legend("topright", lwd = 1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(datetime,elec$Global_reactive_power,type = "l", ylab = "Voltage",xlab = "datetime")

dev.off()
