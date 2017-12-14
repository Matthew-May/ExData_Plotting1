# get data
nameOfData <- read.table("household_power_consumption.txt",
                   nrow=1,sep=";")
d <- read.table("household_power_consumption.txt",
                skip=65500,nrow=5000,sep=";",na.strings = "?")

d$V1 <- as.Date(d$V1,format="%d/%m/%Y")
d$V2 <- as.character(d$V2)


names(d) <- unlist(nameOfData[1,])
library(dplyr)
d <- filter(d,Date>=as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
d <- mutate(d,datetime=paste(Date,Time,sep=" "))
d$datetime <- strptime(d$datetime,format = "%Y-%m-%d %H:%M:%S")

# plot
png(filename='plot3.png',width = 480,height = 480)
plot(d$datetime,d$Sub_metering_1,type = "n",xlab="",
     ylab = "Energy sub metering")
lines(d$datetime,d$Sub_metering_1,col="black")
lines(d$datetime,d$Sub_metering_2,col="red")
lines(d$datetime,d$Sub_metering_3,col="blue")

legend("topright",lty = 1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

