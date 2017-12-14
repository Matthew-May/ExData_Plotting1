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



# plot
png(filename='plot1.png',width = 480,height = 480)
hist(d$Global_active_power,xlab="Global Active Power(Kilowatts)",
     ylab="Frequency",col="red",main="Global Active Power")
dev.off()

