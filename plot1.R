#ExData_Plotting1
#================
#
#Plotting Assignment 1 for Exploratory Data Analysis



require("readr")
require("data.table")
require("sqldf")
colClass=c("character", "character", "character", "character", "character", "character", "character","character", "character")

df_EA <- read.csv.sql("household_power_consumption.txt", sep = ";",sql = "select * from file  where Date in ('1/2/2007', '2/2/2007') ", header = TRUE, colClasses=colClass)

df_EA$WeekDay <- weekdays(as.Date(df_EA$Date,"%d/%m/%Y"))
df_EA$DateTime <- as.POSIXct(paste(df_EA$Date, df_EA$Time),format = "%d/%m/%Y %H:%M:%S" )


hist(as.numeric(df_EA$Global_active_power), col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global_active_power")
dev.copy(png, file = "plot1.png")
dev.off()

