library(dplyr)

png("plot2.png", width=480, height=480)
household <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                        colClasses = "character")
household$Date <- strptime(household$Date, format = "%d/%m/%Y")
data_used <- filter(household, Date==strftime("2007-02-01") | Date==strftime("2007-02-02"))
data_used$Global_active_power <- as.numeric(data_used$Global_active_power)
#the end of 2007-02-01
#length1 + 1 : beginning of 2007-02-02
tick1 <- dim(subset(data_used, Date==strftime("2007-02-01")))[1]
#end of 2007-02-02
tick2 <- dim(data_used)[1]
with(data_used, plot(seq(dim(data_used)[1]), Global_active_power, type="l", xaxt="n",
                     xlab="", ylab="Global Active Power (kilowatts)"))
axis(1, at=c(1,tick1+1, tick2+1), labels=c("Thu","Fri","Sat"))
dev.off()
