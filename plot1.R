png(filename = "Plot1.png", width = 480, height = 480, units = "px")

# Read the data set from the CSV file. 
hpc <- read.csv("./household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors=FALSE)
# Format the date strings into the date objects.
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
# Filter out the dates that we are looking for 
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02", ]
# Create the histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Plot the chart to the PNG file.
dev.off()