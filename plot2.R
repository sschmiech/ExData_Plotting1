source("prepareData.R")
data<-getData()

png(filename = "plot2.png", width = 480, height = 480)
plot(as.POSIXct(data$timestamp), as.numeric(data$Global_active_power),  type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off() 


