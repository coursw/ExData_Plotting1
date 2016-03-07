
# load data from the file
dataset <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# convert date strings to R Date type
dataset$Date <- as.Date(dataset$Date , "%d/%m/%Y")

# subset the dataset to extract only the 2 days we want the data for
df <- with(dataset, dataset[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

# create the device to plot the graph
png(file="plot1.png",width=480, height=480)

# plot the histogram of global active power (in kilowatts)
hist(df$Global_active_power, 
     col = "red", 
     main ="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# close the device to write out the image buffer to the device
dev.off()


