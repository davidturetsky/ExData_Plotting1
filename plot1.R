plot1<-function(){
        ## Read in data
        house_consumption<-read.delim("household_power_consumption.txt", header=FALSE,sep=";",dec=".", skip=66637,nrows=2880)      

        ## Name the columns due to skipped rows
        names(house_consumption)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        
        ## Date and time transform
        date_time<-paste(house_consumption$Date,house_consumption$Time)
        dates_times<-strptime(date_time,format="%d/%m/%Y %H:%M:%S")
        
        ## Plot of the frequency of Global Active Power consumption
        hist(house_consumption$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main=paste("Global Active Power"))

        ## Write to png
        dev.copy(png, file="plot1.png", width = 480, height = 480)

        ## Closes connection
        dev.off()

}
