library(dplyr)
data <- read.csv("household_power_consumption.txt", 
                 sep=";", 
                 colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                 na.strings = "?")
dataf <- rbind(filter(data, Date == "1/2/2007" ), filter(data, Date == "2/2/2007" ))

write.table(dataf, 'household_power_consumption_filter.csv')