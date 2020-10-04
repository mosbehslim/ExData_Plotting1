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

png("plot1.png", width=480, height=480)
hist(mydf$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


                
                   