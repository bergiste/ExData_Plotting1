#Run subset-data.R to generate "household_power_consumption_filter.csv" if it does not exist
dataf <- read.table("household_power_consumption_filter.csv")

hist(dataf$Global_active_power, col = "red", main = "Global Active Power",  xlab = "Global Active Power (kilowatts)")
dev.copy(png, 'plot1.png')
dev.off()