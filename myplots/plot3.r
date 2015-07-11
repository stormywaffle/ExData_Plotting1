
plot3 <- function(){
	all_data <- read.csv("./household_power_consumption.txt", sep = ";", header=TRUE)
	two_days <- all_data[all_data$Date=="1/2/2007"| all_data$Date=="2/2/2007", ]
	
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
	 
	plot(all_meters, ylab="Energy sub metering" , xlab = "", xaxt = 'n', type='n')
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
	
	lines(Sub_metering1, col = "black")
	lines(Sub_metering2, col = "red")
	lines(Sub_metering3, col = "blue")
	
	legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	dev.copy(png, file = "plot3.png") 
    dev.off()
	
}