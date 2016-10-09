require(dplyr)
hpc <- read.csv("~/Desktop/household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = F)

hpc <- tbl_df(hpc)
myformat <- "%d/%m/%Y"
hpc <- mutate(hpc, Date = as.Date(Date,myformat))

hpc_final <- subset(hpc,Date == "2007-02-01" | Date == "2007-02-02")
# newdata <- hpc[which(hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02"),]
png("plot1.png", width=480, height=480)
hist(hpc_final$Global_active_power,col = "red")
dev.off()
