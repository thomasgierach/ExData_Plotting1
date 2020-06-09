library(dplyr)
library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- lubridate::dmy_hms(hpc$DateTime)
hpc2 <- hpc[hpc$DateTime >= lubridate::ymd("2007-02-01") & hpc$DateTime < lubridate::ymd("2007-02-03"),]

##plot 3
png(filename = "plot3.png")
plot(hpc2$DateTime, hpc2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc2$DateTime, hpc2$Sub_metering_2, col = "red")
lines(hpc2$DateTime, hpc2$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 0.5)
dev.off()

