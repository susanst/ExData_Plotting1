
# Read in the data from the text file...
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

#Subset the data desired for Feb 1st and 2nd, 2007
feb <- data[(data$Date==c("1/2/2007")| data$Date==c("2/2/2007")),]


feb$DateTime <- as.POSIXct(strptime(paste(feb$Date,feb$Time), "%d/%m/%Y %H:%M:%S"))

plot(feb$DateTime,feb$Global_active_power, type="l",ylab=c("Global Active Power (kilowatts)"), xlab="")

#copy to a png file...
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


