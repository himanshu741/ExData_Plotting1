
#read the file
x<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec =".")
#extract data which has dates as 1/2/2007 or 2/2/2007

x<-x[x$Date=="1/2/2007" | x$Date=="2/2/2007",]

##create datetime by using striptime()
datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

x$Sub_metering_1<-as.numeric(x$Sub_metering_1)

x$Sub_metering_2<-as.numeric(x$Sub_metering_2)

x$Sub_metering_3<-as.numeric(x$Sub_metering_3)

png("plot3.png", width=480, height=480)

#plot the required graph
plot(datetime, x$Sub_metering_1 , type="l", ylab="Energy Submetering", xlab="")
lines(datetime,x$Sub_metering_2,type = "l",col="red")
lines(datetime,x$Sub_metering_3,type = "l",col="blue")
legend("topright",lty=1, lwd=2.5,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()
