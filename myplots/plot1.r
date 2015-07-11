
plot1 <- function(){
    all_data <- read.csv("./household_power_consumption.txt", sep = ";", header=TRUE)
	two_days <- all_data[all_data$Date=="1/2/2007"| all_data$Date=="2/2/2007", ]
	Global_Active_Power <- two_days[,3 ]
	Global_Active_Power <- as.numeric(as.character(Global_Active_Power))
	hist(Global_Active_Power, col="orange", xlab="Global Active Power (kilowatts)", main ="Global Active Power")
    dev.copy(png, file = "plot1.png") 
    dev.off()  
}