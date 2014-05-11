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
# PLOT 1
################################
png(file="plot1.png")
hist(data$Global_active_power,xlab = "GLobal Active Power (kilowatts)", ylab = "Frequency",col="red",main="Global Active Power")
dev.off()
