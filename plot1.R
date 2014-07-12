dir<-getwd()
setwd(dir)

at<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= c("?"), stringsAsFactors=FALSE)
at$Date<-strptime(at$Date, "%d/%m/%Y")
at$Date<-format(at$Date,"%Y-%m-%d")

sub<-at[at$Date=="2007-02-01" | at$Date=="2007-02-02",] 

hist((sub$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()