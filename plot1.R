## download and read in data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
dat <- read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
unlink(temp)

## subset data for the two days of interest
mydat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
attach(mydat)

## plot
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
