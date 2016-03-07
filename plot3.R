# load data from the file
dataset <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# convert date strings to R Date type
dataset$Date <- as.Date(dataset$Date , "%d/%m/%Y")

# subset the dataset to extract only the 2 days we want the data for
df <- with(dataset, dataset[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

library(lubridate)

# create a datetime vector -- use lubridate to convert the strings to proper dates
datetime <- ymd_hms(paste(df$Date, df$Time))

# combine the vector and the dataset
df <- cbind(datetime, df)


# create the device to plot the graph
png(file="plot3.png",width=480, height=480)

# take the names of the variables we want and make a vector to use for the labels
plotLabels <- names(df)[(length(names(df))-2):length(names(df))]
plotColors <- c("black", "red", "blue")

# plot the global active power (in kilowatts)
with(df, {
  plot(datetime, Sub_metering_1, pch="",xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", plotLabels, lty=c(1,1), col = plotColors)
})

# close the device to write out the image buffer to the device
dev.off()


