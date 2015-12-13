library(data.table)
library(dplyr)
library(lubridate)
library(grDevices)

elec <- fread("household_power_consumption.txt",na.strings = "?")
# We will only be using data from the
#dates 2007-02-01 and 2007-02-02
elec$Date <- dmy(elec$Date) 
elec <- filter(elec, Date == ymd("2007-02-01") |Date == ymd("2007-02-02") )
png(file = "Plot1.png", bg = "transparent")
plot1 <- hist(elec$Global_active_power, col = "red", main = "Global Active Power", xlab = 
                      "Global Active Power(kilowatt)")
dev.off()
