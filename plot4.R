plot4<-function(){
        ## Read in data
        house_consumption<-read.delim("household_power_consumption.txt", header=FALSE,sep=";",dec=".", skip=66637,nrows=2880)      

        ## Name the columns due to skipped rows
        names(house_consumption)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        
        ## Date and time transform
        date_time<-paste(house_consumption$Date,house_consumption$Time)
        dates_times<-strptime(date_time,format="%d/%m/%Y %H:%M:%S")
                
        ## Plot of the frequency of Sub_metering
        png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
        par(mfrow=c(2,2))
        with(house_consumption,{
                plot(dates_times,Global_active_power,xlab="",ylab="Global Active Power",type="l")
                plot(dates_times,Voltage,ylab="Voltage",xlab="datetime",type="l")
                with(house_consumption,{
                        plot(dates_times,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
                        lines(dates_times,house_consumption$Sub_metering_2,type="l", col="red")
                        lines(dates_times,house_consumption$Sub_metering_3,type="l", col="blue")
                        legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
                })
                plot(dates_times,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
        })
        
        ## Write to png
        ##dev.copy(png, file="plot4.png", width = 480, height = 480)

        ## Closes connection
        dev.off()

}
