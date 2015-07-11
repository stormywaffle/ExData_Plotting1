
plot4 <- function(){
    all_data <- read.csv("./household_power_consumption.txt", sep = ";", header=TRUE)
	two_days <- all_data[all_data$Date=="1/2/2007"| all_data$Date=="2/2/2007", ]
	
	Global_Active_Power <- two_days[,3 ]
	Global_Active_Power <- as.numeric(as.character(Global_Active_Power))
	
	Sub_metering1 <- two_days[,7]
	Sub_metering1 <- as.numeric(as.character(Sub_metering1))
	Sub_metering1 <- ts(Sub_metering1, frequency = length(Sub_metering1)/2, start = c(1, 3))
	
    Sub_metering2 <- two_days[,8]
	Sub_metering2 <- as.numeric(as.character(Sub_metering2))
	Sub_metering2 <- ts(Sub_metering2, frequency = length(Sub_metering2)/2, start = c(1, 3))
	
	Sub_metering3 <- two_days[,9]
	Sub_metering3 <- as.numeric(as.character(Sub_metering3))
	Sub_metering3 <- ts(Sub_metering3, frequency = length(Sub_metering3)/2, start = c(1, 3))
	
	
	all_meters <- c(Sub_metering1, Sub_metering2, Sub_metering3)
	all_meters <- ts(all_meters, frequency = length(all_meters)/2, start = c(1, 3))
	
	Voltage <- two_days[,5 ]
	Voltage <- as.numeric(as.character(Voltage))
	
	Global_reactive_power <- two_days[,4 ]
	Global_reactive_power <- as.numeric(as.character(Global_reactive_power))

	par(mfcol= c(2, 2), mar = c(4.5, 2, 1, 2))
	plot(ts(Global_Active_Power, frequency = length(Global_Active_Power)/2, start = c(1, 3)), ylab="Global Active Power (kilowatts)" , xlab = "", xaxt = 'n', )
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
	
	plot(all_meters, ylab="Energy sub metering" , xlab = "", xaxt = 'n', type='n')
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
	lines(Sub_metering1, col = "black")
	lines(Sub_metering2, col = "red")
	lines(Sub_metering3, col = "blue")
	legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n')
	
	plot(ts(Voltage, frequency = length(Voltage)/2, start = c(1, 3)), ylab="Voltage" , xlab = "datetime", xaxt = 'n', )
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
	
	plot(ts(Global_reactive_power, frequency = length(Global_reactive_power)/2, start = c(1, 3)), ylab="global_reactive_power" , xlab = "datetime", xaxt = 'n')
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))

	dev.copy(png, file = "plot4.png") 
    dev.off()
}