hpc <- read.csv("~/Desktop/household_power_consumption.txt", sep=";",stringsAsFactors = F)
hpcsubset <- hpc[hpc$Date %in% c("1/2/2007" , "2/2/2007"),]
myformat <- "%d/%m/%Y %H:%M:%S"
datetime <-  strptime(paste(hpcsubset$Date,hpcsubset$Time,sep = " "),myformat)

globalActivePower <- as.numeric(hpcsubset$Global_active_power)
subMetering1 <- as.numeric(hpcsubset$Sub_metering_1)
subMetering2 <- as.numeric(hpcsubset$Sub_metering_2)
subMetering3 <- as.numeric(hpcsubset$Sub_metering_3)
        
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
