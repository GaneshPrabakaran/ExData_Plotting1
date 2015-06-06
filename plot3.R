#ExData_Plotting3
#================
#
#Plotting Assignment 3 for Exploratory Data Analysis



require("readr")
require("data.table")
require("sqldf")
colClass=c("character", "character", "character", "character", "character", "character", "character","character", "character")
df_EA <- read.csv.sql("household_power_consumption.txt", sep = ";",sql = "select * from file  where Date in ('1/2/2007', '2/2/2007') ", header = TRUE, colClasses=colClass)


df_EA$WeekDay <- weekdays(as.Date(df_EA$Date,"%d/%m/%Y"))
df_EA$DateTime <- as.POSIXct(paste(df_EA$Date, df_EA$Time),format = "%d/%m/%Y %H:%M:%S" )


plot(df_EA$DateTime, as.numeric(df_EA$Sub_metering_1), type = "n",xlab = "", ylab = "Energy sub metering")
lines(df_EA$DateTime, as.numeric(df_EA$Sub_metering_1), col = "Black")
lines(df_EA$DateTime, as.numeric(df_EA$Sub_metering_2), col = "Red")
lines(df_EA$DateTime, as.numeric(df_EA$Sub_metering_3), col = "Blue")
par(mar = c(0,0,0,0))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), xjust = 0, yjust = 0, lty = c(1,1,1), lwd = c(1,1,1), col = c("black", "red", "blue"), cex = .8, merge = FALSE)

dev.copy(png, file = "plot3.png")
dev.off()


