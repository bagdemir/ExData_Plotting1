png(filename = "Plot2.png", width = 480, height = 480, units = "px")

# Read the data set from the CSV file. 
hpc <- read.csv("./household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors=FALSE)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]
hpc$dt <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$dt <- strptime(hpc$dt, format="%Y-%m-%d %H:%M:%S")

# Create the histogram
with(hpc, plot(dt, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

# Plot the chart to the PNG file.
dev.off()