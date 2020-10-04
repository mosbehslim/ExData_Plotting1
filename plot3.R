library(lubridate)

lines<-readLines("household_power_consumption.txt")
# Saving the names
Mynames = lines[1]
#select the appropriate lines
SelectedLines <-grep("^[1-2]\\/2\\/2007",lines,value = TRUE)

#transform the selected lines in data frame

mydf = read.table(textConnection(SelectedLines),sep=";")


#recupering the col names
coln = read.table(textConnection(Mynames),sep = ";")
#Renaming the col names of the data frame
names(mydf) = coln[1,]

datetime <- strptime(paste(mydf$Date, mydf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, mydf$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, mydf$Sub_metering_2, type="l", col="red")
lines(datetime, mydf$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 



                
                   