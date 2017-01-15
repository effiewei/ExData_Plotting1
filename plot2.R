setwd("/Volumes/Transcend/Statistics Language/R/Coursera/Exploratory Data Analysis with R/Week1")
file <- read.csv2("household_power_consumption.txt")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
data <- file[file$Date == "2007-02-01" | file$Date == "2007-02-02", ]
data2 <- data.frame(data$Global_active_power)
f <- data$Global_active_power
newf <- as.numeric(levels(f))[f]
newf2 <- newf[is.na(newf)==FLASE]
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png('plot2.png')
plot(datetime, newf2, type="o", pch=".:", ylab="Global Active Power (kilowatts)")
dev.off()
