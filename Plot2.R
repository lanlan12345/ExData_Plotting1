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
png(file = "Plot2.png", bg = "transparent")
plot2 <- plot(datetime,elec$Global_active_power,type = "l", ylab = "Global Active Power(kilowatt)",xlab = "")
dev.off()
