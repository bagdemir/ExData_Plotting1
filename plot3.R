png(filename = "Plot3.png", width = 480, height = 480, units = "px")

# Read the data set from the CSV file. 
hpc <- read.csv("./household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors=FALSE)

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]
hpc$dt <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$dt <- strptime(hpc$dt, format="%Y-%m-%d %H:%M:%S")

# Create the histogram
plot(hpc$dt, hpc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc$dt, hpc$Sub_metering_2, lwd=2, col="red")
lines(hpc$dt, hpc$Sub_metering_3, lwd=2, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))

# Flush the chart to the PNG file.
dev.off()