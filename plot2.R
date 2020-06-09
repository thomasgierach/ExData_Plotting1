library(dplyr)
library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- lubridate::dmy_hms(hpc$DateTime)
hpc2 <- hpc[hpc$DateTime >= lubridate::ymd("2007-02-01") & hpc$DateTime < lubridate::ymd("2007-02-03"),]

##plot 2
png(filename = "plot2.png")
plot(hpc2$DateTime, hpc2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
