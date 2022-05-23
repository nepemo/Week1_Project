library(dplyr)

png("plot1.png", width=480, height=480)
household <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                        colClasses = "character")
household$Date <- strptime(household$Date, format = "%d/%m/%Y")
data_used <- filter(household, Date==strftime("2007-02-01") | Date==strftime("2007-02-02"))
data_used$Global_active_power <- as.numeric(data_used$Global_active_power)
with(data_used, hist(Global_active_power, col="red", xlab ="Global Active Power (kilowatts)", 
                     main="Global Active Power"))
dev.off()
