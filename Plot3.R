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
png(file = "Plot3.png", bg = "transparent")
plot2 <- plot(datetime,elec$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
points(datetime,elec$Sub_metering_2, type = "l", col="red")
points(datetime,elec$Sub_metering_3, type = "l", col="blue")
legend("topright", lwd = 1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()