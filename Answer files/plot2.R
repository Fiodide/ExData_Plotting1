library(data.table)
data <- fread("./data/Electric_power_consumption/household_power_consumption.txt")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data2 <- data[which(data$Date=="2007-02-01"|data$Date=="2007-02-02")]
data2$Global_active_power <- as.numeric(data2$Global_active_power)

st <- strptime("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S")
en <- strptime("2007-02-02 23:59:00",format = "%Y-%m-%d %H:%M:%S")
date <- seq(st,en,"1 min")
plot(data2$Global_active_power~date,type="l",xlab="",ylab="Global active power(kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()