
plot2 <- function(){
    all_data <- read.csv("./household_power_consumption.txt", sep = ";", header=TRUE)
	two_days <- all_data[all_data$Date=="1/2/2007"| all_data$Date=="2/2/2007", ]
	Global_Active_Power <- two_days[,3 ]
	Global_Active_Power <- as.numeric(as.character(Global_Active_Power))
	plot(ts(Global_Active_Power, frequency = length(Global_Active_Power)/2, start = c(1, 3)), ylab="Global Active Power (kilowatts)" , xlab = "", xaxt = 'n', )
	axis(1, at=1:3, labels = c("Thu", "Fri", "Sat"))
	dev.copy(png, file = "plot2.png") 
    dev.off()
}