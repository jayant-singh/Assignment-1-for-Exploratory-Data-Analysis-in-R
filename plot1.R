#Here, we give the code to plot values of Global Active power as histogram.

###########################################################################



data_new=read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_two_day=data_new[(as.character(data_new$Date)=="1/2/2007"|as.character(data_new$Date)=="2/2/2007"),]


png(file="plot1.png")

hist(as.numeric(as.character(data_two_day$Global_active_power)),col="red",main=paste("Global Active Power"),
xlab="Global Active Power(kilowatt)")
dev.off()
