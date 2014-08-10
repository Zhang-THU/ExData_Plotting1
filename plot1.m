plot1 <-function ()
{
x <- read.table("household_power_consumption.txt",sep = ";",nrow = 100000,head = T,na.strings="?")
x$Date <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
low_time <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
upp_time <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
x <- x[x[,1]>low_time & x[,1] < upp_time,]
hist(x[,3] ,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")
dev.copy(png,file = "plot1.png")
dev.off()
}
