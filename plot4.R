#Run subset-data.R to generate "household_power_consumption_filter.csv" if it does not exist
library(lubridate)
data <- read.table("household_power_consumption_filter.csv")
data$Date <- paste(data$Date,data$Time, sep =" ")
data$Date <- parse_date_time(data$Date, "dmy HMS")

par(mfrow = c(2,2))
plot(data$Date,
     type = 'l',
     data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(data$Date,
     type = 'l',
     data$Voltage,
     ylab = "Voltage",
     xlab = "datetime")

plot(data$Date, 
     data$Sub_metering_1 + data$Sub_metering_2 + data$Sub_metering_3, 
     type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_1, col = "black")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       c(Sub_metering_1,Sub_metering_2,Sub_metering_3),
       pch = 20,
       col = c('black', 'red', 'blue'))

plot(data$Date,
     type = 'l',
     data$Global_active_power,
     ylab = "Global_active_power",
     xlab = "datetime")

dev.copy(png, 'plot4.png')
dev.off()

