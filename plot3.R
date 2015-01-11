plot3<-function(){
  library("sqldf")
  data<-read.csv.sql(file="household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",drv="SQLite")
  library("timeDate")
  
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
  data$DateAndTime<-timeDate(paste(data$Date,data$Time))
  
  png(filename="plot3.png", height=480, width=480, bg="white")

  plot(data$DateAndTime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  points(data$DateAndTime,data$Sub_metering_1,type="l")
  points(data$DateAndTime,data$Sub_metering_2,col="red",type="l")
  points(data$DateAndTime,data$Sub_metering_3,col="blue",type="l")
  legend("topright", lty=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.off()

}
