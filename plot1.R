setwd("/Volumes/Transcend/Statistics Language/R/Coursera/Exploratory Data Analysis with R/Week1")
file <- read.csv2("household_power_consumption.txt")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
data <- file[file$Date == "2007-02-01" | file$Date == "2007-02-02", ]
f <- data$Global_active_power
newf <- as.numeric(levels(f))[f]
png('plot1.png')
hist(newf, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


