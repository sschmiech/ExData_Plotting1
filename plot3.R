source("prepareData.R")
data<-getData()

png(filename = "plot3.png", width = 480, height = 480)
plot(as.POSIXct(data$timestamp), as.numeric(data$Sub_metering_1),  type = "l", ylab="Energy sub metering", xlab = "")
lines(as.POSIXct(data$timestamp),data$Sub_metering_2, col="red")
lines(as.POSIXct(data$timestamp),data$Sub_metering_3, col="blue")
#legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
legend("topright", col=c("black", "red", "blue"), lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
