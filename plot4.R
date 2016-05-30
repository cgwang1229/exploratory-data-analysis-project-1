## download and read in data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
dat <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
unlink(temp)

## subset data for the two days of interest
mydat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
attach(mydat)

## convert date and time
datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
## plot 1
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
## plot 2
plot(datetime, Voltage, type="l")
## plot 3
plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
## plot 4
plot(datetime, Global_reactive_power, type="l")
dev.off()


