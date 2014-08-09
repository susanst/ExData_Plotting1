
# Read in the data from the text file...
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

#Subset the data desired for Feb 1st and 2nd, 2007
feb <- data[(data$Date==c("1/2/2007")| data$Date==c("2/2/2007")),]

hist(feb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main=paste("Global Active Power"))

#copy to a png file...
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

