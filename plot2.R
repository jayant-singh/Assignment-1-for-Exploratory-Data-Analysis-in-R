# Here, we give the code to plot values of Global active power vs. Datetime.
#This plot gives the consumption trend on those two days, Thursday and Friday.

###########################################################################



data_new=read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_two_day=data_new[(as.character(data_new$Date)=="1/2/2007"|as.character(data_new$Date)=="2/2/2007"),]

data_two_day$Date=as.character(data_two_day$Date)
data_two_day$Date=as.Date(data_two_day$Date,"%d/%m/%Y")


#convert the dates

datetime = paste(data_two_day$Date, data_two_day$Time)
data_two_day$Datetime = as.POSIXct(datetime)



#plot it

png(file="plot2.png")



plot(as.numeric(as.character(data_two_day$Global_active_power)) ~ data_two_day$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()