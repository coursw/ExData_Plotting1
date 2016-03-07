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
png(file="plot2.png",width=480, height=480)

# plot the global active power (in kilowatts)
with(df, {
  plot(datetime, Global_active_power, pch="",xlab="", ylab="Global Active Power (kilowatts)")
  lines(datetime, Global_active_power)  
})

# close the device to write out the image buffer to the device
dev.off()


