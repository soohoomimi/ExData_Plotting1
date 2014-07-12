dir<-getwd()
setwd(dir)

at<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= c("?"), stringsAsFactors=FALSE)
at$Date<-strptime(at$Date, "%d/%m/%Y")
at$Date<-format(at$Date,"%Y-%m-%d")

sub<-at[at$Date=="2007-02-01" | at$Date=="2007-02-02",] 

datetime<-strptime(paste(sub$Date,sub$Time), format="%Y-%m-%d %H:%M:%S")
with(sub, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png")
dev.off()