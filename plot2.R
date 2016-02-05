
#read the file
x<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")

#extract data which has dates as 1/2/2007 or 2/2/2007
x<-x[x$Date=="1/2/2007" | x$Date=="2/2/2007",]

#create datetime by using striptime()
datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
x$Global_active_power<-as.numeric(x$Global_reactive_power)

png("plot2.png", width=480, height=480)

#plot graph
plot(datetime,x$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off
