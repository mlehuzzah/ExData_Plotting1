plot1<-function(){
  library("sqldf")
  data<-read.csv.sql(file="household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",drv="SQLite")
  png(filename="plot1.png", height=480, width=480, bg="white")
  hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts")
  dev.off()
}