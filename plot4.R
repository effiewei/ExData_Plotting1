setwd("/Volumes/Transcend/Statistics Language/R/Coursera/Exploratory Data Analysis with R/Week1")
file <- read.csv2("household_power_consumption.txt")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
data <- file[file$Date == "2007-02-01" | file$Date == "2007-02-02", ]
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

sub1 <- data$Sub_metering_1
sub1 <- as.numeric(levels(sub1))[sub1]

sub2 <- data$Sub_metering_2
sub2 <- as.numeric(levels(sub2))[sub2]

sub3 <- data$Sub_metering_3
sub3 <- as.numeric(levels(sub3))[sub3]

a <- data$Global_active_power
a <- as.numeric(levels(a))[a]

v <- data$Voltage
v <- as.numeric(levels(v))[v]

r <- data$Global_reactive_power
r <- as.numeric(levels(r))[r]

png('plot4.png')
par(mfrow=c(2,2))
plot(datetime, a, type="o", pch=".:", ylab="Global Active Power (kilowatts)", xlab="")
plot(datetime, v, type="o", pch=".:", ylab="Voltage")
plot(datetime, sub1, type="o", pch=".:", xlab="", ylab="Energy sub metering")
lines(datetime, sub2, type="o", pch=".:", col="red")
lines(datetime, sub3, type="o", pch=".:", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=c(1,1,1), col=c("black", "red", "blue"))
plot(datetime, r, type="o", pch=".:", ylab="Global_reactive_power")
dev.off()



