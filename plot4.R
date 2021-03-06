################################
# DATA LOADING AND PREPARATION
################################

#read the file
allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#filter the content so we keep only what is needed and remove the rest from memory
data<-allData[(allData$Date=="1/2/2007" | allData$Date=="2/2/2007"),]
rm(allData)

#Create a new DateTime variable
# 1. Create a new string variable from existing Date and Time variables
data$DateTime<-paste(data$Date,data$Time,sep=" ")
# 2. Convert it to POSIXlt time/date
data$DateTime<-strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")

################################
# PLOT 4
################################
Sys.setlocale("LC_TIME", "C")
png(file="plot4.png")
par(mfcol = c(2, 2))
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="Black")
points(x=data$DateTime,y=data$Sub_metering_2,type="l",col="Red")
points(x=data$DateTime,y=data$Sub_metering_3,type="l",col="Blue")
legend("topright", col = c("black","red","blue"),legend=c("sub_metering_1", "sub_metering_2","sub_metering_3"),lty=1,bty="n")
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime",col="Black")
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",col="Black")
dev.off()