rm(list=ls())
cons<-read.table('household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
sub<- subset(cons, (cons$Date == "1/2/2007" | cons$Date== "2/2/2007"))
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))
png("plot3.png", width = 480, height = 480)
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()