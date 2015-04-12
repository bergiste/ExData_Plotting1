#Run subset-data.R to generate "household_power_consumption_filter.csv" if it does not exist
library(lubridate)
data <- read.table("household_power_consumption_filter.csv")
data$Date <- paste(data$Date,data$Time, sep =" ")
data$Date <- parse_date_time(data$Date, "dmy HMS")
plot(data$Date,
     type = 'l',
     data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.copy(png, 'plot2.png')
dev.off()