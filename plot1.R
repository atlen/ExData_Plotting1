         
#The tabulated strings below to be used commonly as a beginning of each plotting file as per anassignment.
           #Iprefer to set working directory but could be just comment next string.
            setwd("C:/Users/atlen/Desktop/For Coursera courses/R Programming/Course4_week1_project")
            
            #Cleanup the desk before manipulation
            rm(list=ls())
            
            #Download by using temporary file
            temp <- tempfile()
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
            df<- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", dec = ".", stringsAsFactors = F, na.strings = "?")
            unlink(temp)
            
            #Combine 2 columns(date and time)
            dt <- as.POSIXct(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S") 
            
            #Data.frame with datetime column
            df1<-as.data.frame(cbind(dt, df[,3:9]), colnames = c("datetime", colnames(df[3:9]))) 
            
            #Let's cleanup the desk
            rm(df,dt,temp) 
            #Time limits set-up
            date1 <- as.POSIXct("2007-02-01 00:00:00"); date2<- as.POSIXct("2007-02-02 23:59:59") 
            df<- df1[df1$dt>=date1 & df1$dt <= date2,] #Subset metering done within the time limits
            df<-df[complete.cases(df),] 
            #Finally...Data.frame called df is ready for plotting)))
##End of commonly used strings

#Plotting and Creating png file
      
  png(filename = "plot1.png", width= 480, height=480)
       
      hist(df$Global_active_power, 
         col="red", xlab="Global Active Power(kilowatts)",
         ylab="Frequency",main = "Global Active Power",
         bg= "white")
      
  dev.off()
  
            