#Here, we give the code to give the matrix plot.

###########################################################################




data_new=read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_two_day=data_new[(as.character(data_new$Date)=="1/2/2007"|as.character(data_new$Date)=="2/2/2007"),]

data_two_day$Date=as.character(data_two_day$Date)
data_two_day$Date=as.Date(data_two_day$Date,"%d/%m/%Y")

#Convert the dates

datetime = paste(data_two_day$Date, data_two_day$Time)
data_two_day$Datetime = as.POSIXct(datetime)

#give the plot

png(file="plot4.png")
par (mfrow=c(2,2))

plot(as.numeric(as.character(data_two_day$Global_active_power))~data_two_day$Datetime, type = "l",ylab="Global Active Power",xlab="")
plot(as.numeric(as.character(data_two_day$Voltage))~data_two_day$Datetime, type = "l",ylab="Voltage",xlab="datetime")

plot(as.numeric(as.character(data_two_day$Sub_metering_1)) ~ data_two_day$Datetime, type = "l",
     ylab = "Energy sub metering", xlab = "",col="black")


lines(data_two_day$Datetime,as.numeric(as.character(data_two_day$Sub_metering_2)),
col="red")

lines(data_two_day$Datetime,as.numeric(as.character(data_two_day$Sub_metering_3)),
col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red",
"blue"),bty="n")

plot(as.numeric(as.character(data_two_day$Global_reactive_power))~data_two_day$Datetime, type = "l",ylab="Global Reactive Power",xlab="datetime")
dev.off()

