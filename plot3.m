plot3 <-function ()
{
    png(file = "plot3.png")
    x <- read.table("household_power_consumption.txt",sep = ";",nrow = 100000,head = T,na.strings="?")
    x$Date <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
    low_time <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    upp_time <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    x <- x[x[,1]>low_time & x[,1] < upp_time,]
    Sys.setlocale("LC_TIME", "English")
    with (x,{
    plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    points(Date,Sub_metering_2,type="l",col="red")
  	points(Date,Sub_metering_3,type="l",col="blue")
    })
    legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
    dev.off()
}

