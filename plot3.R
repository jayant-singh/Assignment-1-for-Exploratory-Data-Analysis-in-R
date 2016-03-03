#Here, we give the code to plot values of Sub metering vs. Datetime.This plot gives
#the consumption trend on those two days, Thursday and Friday.

###########################################################################


data_new=read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_two_day=data_new[(as.character(data_new$Date)=="1/2/2007"|as.character(data_new$Date)=="2/2/2007"),]

data_two_day$Date=as.character(data_two_day$Date)
data_two_day$Date=as.Date(data_two_day$Date,"%d/%m/%Y")

#convert the dates

datetime = paste(data_two_day$Date, data_two_day$Time)
data_two_day$Datetime = as.POSIXct(datetime)

#plot the graph on png file

png(file="plot3.png")
plot(as.numeric(as.character(data_two_day$Sub_metering_1)) ~ data_two_day$Datetime, type = "l",
     ylab = "Energy sub metering", xlab = "",col="black")


lines(data_two_day$Datetime,as.numeric(as.character(data_two_day$Sub_metering_2)),
col="red")

lines(data_two_day$Datetime,as.numeric(as.character(data_two_day$Sub_metering_3)),
col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red",
"blue"))
dev.off()