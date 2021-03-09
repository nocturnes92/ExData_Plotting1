#read whole data
data <- read.table("household_power_consumption.txt", header=TRUE,
                   na.strings="?", sep=";")
#standardize date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#select data
data <- data[(data$Date=="2007-02-01" | data$Date=="2007-02-02" ), ]

#make histgram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

#output .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
