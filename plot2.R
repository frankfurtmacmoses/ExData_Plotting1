hpc <- read.csv("~/Desktop/household_power_consumption.txt", sep=";",stringsAsFactors = F)

hpcsubset <- hpc[hpc$Date %in% c("1/2/2007" , "2/2/2007"),]
myformat <- "%d/%m/%Y %H:%M:%S"
datetime <-  strptime(paste(hpcsubset$Date,hpcsubset$Time,sep = " "),myformat)
gp <- (hpcsubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, gp, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()
