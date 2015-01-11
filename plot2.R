plot2<-function(){
  library("sqldf")
  data<-read.csv.sql(file="household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",drv="SQLite")
  library("timeDate")
  
  data$Date<-as.Date(data$Date,"%d/%m/%Y")
  data$DateAndTime<-timeDate(paste(data$Date,data$Time))

  png(filename="plot2.png", height=480, width=480, bg="white")

  plot(data$DateAndTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

  dev.off()
  
}