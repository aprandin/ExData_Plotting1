# Reading the data
mydata <- read.csv2('household_power_consumption.txt', na.strings = '?')
mydata$Time <- strptime(paste(mydata$Date,mydata$Time),'%d/%m/%Y %H:%M:%S')

mydata$Date <- as.Date(mydata$Date, '%d/%m/%Y')
mydata_small <- mydata[(mydata$Date >= '2007-02-01' & mydata$Date <= '2007-02-02'),]
for (i in 3:9) {
      mydata_small[,i] <- as.numeric(mydata_small[,i])
}

# Multiple plots settings
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

# Constructing the plots
with(mydata_small, plot(Time, Global_active_power, type = 'l', xlab = '' , ylab = 'Global Active Power'))

with(mydata_small, plot(Time, Sub_metering_1, type = 'l', xlab = '' , ylab = 'Energy sub metering'))
with(mydata_small, lines(Time, Sub_metering_2, col = 'red'))
with(mydata_small, lines(Time, Sub_metering_3, col = 'blue'))
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = c(1,1), lwd = c(1,1), col = c('black','red','blue'), bty = 'n')

with(mydata_small, plot(Time, Voltage, type = 'l', xlab = 'datetime' , ylab = 'Voltage'))

with(mydata_small, plot(Time, Global_reactive_power, type = 'l', xlab = 'datetime' , ylab = 'Global_reactive_power'))

# Closing the graphics device
dev.off()