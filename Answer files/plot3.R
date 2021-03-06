library(data.table)
data <- fread("./data/Electric_power_consumption/household_power_consumption.txt")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data2 <- data[which(data$Date=="2007-02-01"|data$Date=="2007-02-02")]

st <- strptime("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S")
en <- strptime("2007-02-02 23:59:00",format = "%Y-%m-%d %H:%M:%S")
date <- seq(st,en,"1 min")

with(data2,plot(Sub_metering_1~date, xlab="",ylab="Energy sub metering", col="black",type="l"))
points(data2$Sub_metering_2~date,col="red",type="l")
points(data2$Sub_metering_3~date,col="blue",type="l")
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

