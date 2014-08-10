plot2 <-function ()
{
    x <- read.table("household_power_consumption.txt",sep = ";",nrow = 100000,head = T,na.strings="?")
    x$Date <- strptime(paste(x$Date,x$Time), "%d/%m/%Y %H:%M:%S")
    low_time <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    upp_time <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
    x <- x[x[,1]>low_time & x[,1] < upp_time,]
    Sys.setlocale("LC_TIME", "English")
    plot(x$Date,x$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
    dev.copy(png,file = "plot2.png")
    dev.off()
}
