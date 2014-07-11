dir<-getwd()
setwd(dir)

at<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= c("?"), stringsAsFactors=FALSE)
at$Date<-strptime(at$Date, "%d/%m/%Y")
at$Date<-format(at$Date,"%Y-%m-%d")

sub<-at[at$Date=="2007-02-01" | at$Date=="2007-02-02",] 

datetime<-strptime(paste(sub$Date,sub$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png")
par(mfrow=c(2,2))

with(sub, plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

with(sub, plot(datetime, Voltage, type="l", ylab="Voltage"))

with(sub, plot(datetime, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=""))
lines(datetime, sub$Sub_metering_2, type="l", col="red")
lines(datetime, sub$Sub_metering_3, type="l", col="blue")
legend("topright",border="", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black","red","blue"))

with(sub, plot(datetime, Global_reactive_power, type="l"))

dev.off()