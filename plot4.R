#read whole data
data <- read.table("household_power_consumption.txt", header=TRUE,
                   na.strings="?", sep=";")
#standardize date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#select data
data <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02" ), ]

#make plot
data <- transform(data,datetime = paste(data$Date,data$Time))
data$datetime <- as.POSIXct(data$datetime)

par(mfrow=c(2,2))

#plot1
plot(data$Global_active_power~data$datetime, type="l",
     xlab="", ylab="Global Active Power")
#plot2
plot(data$Voltage~data$datetime, type="l",
     xlab="datetime", ylab="Voltage")
#plot3
plot(x = data$datetime, y = data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x = data$datetime, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = data$datetime, y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
plot(data$Global_reactive_power~data$datetime, type="l",
     xlab="datetime", ylab="Global_reactive_power")

#output .png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

#Working in Chinese environment, here 周四 == Thu, 周五 == Fri, 周六 == Sat




