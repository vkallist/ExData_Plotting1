header<-read.csv("household_power_consumption.txt", nrows=1, sep=";")
data<-read.csv("household_power_consumption.txt", header=FALSE, skip=66637, 
               nrows=2880, sep=";", na.strings=c("?"))
names(data)<-names(header)
data$Date<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")
dev.off()
