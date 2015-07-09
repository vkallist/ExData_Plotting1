header<-read.csv("household_power_consumption.txt", nrows=1, sep=";")
data<-read.csv("household_power_consumption.txt", header=FALSE, skip=66637, 
               nrows=2880, sep=";", na.strings=c("?"))
names(data)<-names(header)
data$Date<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(Date, Global_active_power, type="l", xlab="",
                ylab="Global Active Power"))
with(data, plot(Date, Voltage, type="l", xlab="datetime"))
with(data, plot(Date, Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering"))
with(data, lines(Date, Sub_metering_1, type="l", col="black"))
with(data, lines(Date, Sub_metering_2, type="l", col="red"))
with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2",
       "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"),
       bty="n")
with(data, plot(Date, Global_reactive_power, type="l", xlab="datetime"))
dev.off()
