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
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
