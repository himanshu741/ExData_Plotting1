
#read the file
x<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec =".")
#extract data which has dates as 1/2/2007 or 2/2/2007
x<-x[x$Date=="1/2/2007" | x$Date=="2/2/2007",]

x$Global_active_power<-as.numeric(x$Global_active_power)

png("plot1.png", width=480, height=480)

#plot hist
hist(x$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

