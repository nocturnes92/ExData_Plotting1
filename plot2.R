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

plot(data$Global_active_power~data$datetime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

#output .png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#Working in Chinese environment, here 周四 == Thu, 周五 == Fri, 周六 == Sat
