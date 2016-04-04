library(data.table)
data <- fread("./data/Electric_power_consumption/household_power_consumption.txt")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data2 <- data[which(data$Date=="2007-02-01"|data$Date=="2007-02-02")]
data2$Global_active_power <- as.numeric(data2$Global_active_power)
hist(data2$Global_active_power, main="Global active power", xlab="Global active power(kilowatts)", col="red")
dev.copy(png,file="plot1.png")
dev.off()