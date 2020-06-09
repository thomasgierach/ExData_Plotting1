library(dplyr)
library(lubridate)

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- lubridate::dmy_hms(hpc$DateTime)
hpc2 <- hpc[hpc$DateTime >= lubridate::ymd("2007-02-01") & hpc$DateTime < lubridate::ymd("2007-02-03"),]

#Plot 1
par(mfrow = c(1,1))
png(filename = "plot1.png")
hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()