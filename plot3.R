library(dplyr)

png("plot3.png", width=480, height=480)
household <- read.table("household_power_consumption.txt", sep=";", header = TRUE,
                        colClasses = "character")
household$Date <- strptime(household$Date, format = "%d/%m/%Y")
data_used <- filter(household, Date==strftime("2007-02-01") | Date==strftime("2007-02-02"))
data_used$Sub_metering_1 <- as.numeric(data_used$Sub_metering_1)
data_used$Sub_metering_2 <- as.numeric(data_used$Sub_metering_2)
data_used$Sub_metering_3 <- as.numeric(data_used$Sub_metering_3)
#the end of 2007-02-01
#length1 + 1 : beginning of 2007-02-02
tick1 <- dim(subset(data_used, Date==strftime("2007-02-01")))[1]
#end of 2007-02-02
tick2 <- dim(data_used)[1]
x <- seq(dim(data_used)[1])
with(data_used, plot(x, Sub_metering_1, type="l", xaxt="n",
                     xlab="", ylab="Energy sub metering"))
lines(x, data_used$Sub_metering_2, col="red")
lines(x, data_used$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at=c(1,tick1+1, tick2+1), labels=c("Thu","Fri","Sat"))
dev.off()
