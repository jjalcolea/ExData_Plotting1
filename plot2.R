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
# PLOT 2
################################
Sys.setlocale("LC_TIME", "C")
png(file="plot2.png")
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
