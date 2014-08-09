
# Read in the data from the text file...
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

#Subset the data desired for Feb 1st and 2nd, 2007
feb <- data[(data$Date==c("1/2/2007")| data$Date==c("2/2/2007")),]


feb$DateTime <- as.POSIXct(strptime(paste(feb$Date,feb$Time), "%d/%m/%Y %H:%M:%S"))



par(mfrow=c(2,2))

# plot first graph
plot(feb$DateTime,feb$Global_active_power, type="l",ylab=c("Global Active Power"), xlab="")

# plot second graph
plot(feb$DateTime,feb$Voltage, type="l", ylab=c("Voltage"),xlab=c("datetime"))

# plot third graph
plot(feb$DateTime, feb$Sub_metering_1,col="black", type="l",ylab=c("Energy sub metering"),xlab=c(""))
lines(feb$DateTime,feb$Sub_metering_2,col="red",type="l")
lines(feb$DateTime,feb$Sub_metering_3,col="blue",type="l")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)

# plot fourth graph
plot(feb$DateTime,feb$Global_reactive_power, type="l", ylab=c("Global_reactive_power"),xlab=c("datetime"))

#copy to a png file...
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()





