setwd("/Volumes/Transcend/Statistics Language/R/Coursera/Exploratory Data Analysis with R/Week1")
file <- read.csv2("household_power_consumption.txt")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
data <- file[file$Date == "2007-02-01" | file$Date == "2007-02-02", ]
f <- data$Global_active_power
newf <- as.numeric(levels(f))[f]
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png('plot2.png')
plot(datetime, newf, type="o", pch=".:", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
