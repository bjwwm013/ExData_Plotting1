library(data.table)
df <- fread("household_power_consumption.txt", sep=";")
dfa <- df[grep("[12]/2/2007",df$Date)]
a <- paste(dfa$Date,dfa$Time,sep=" ")
b <- strptime(a,"%d/%m/%Y %H:%M:%S")
t1 <- strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S")
t2 <- strptime("2/2/2007 23:59:59","%d/%m/%Y %H:%M:%S")
d <- (t1<=b & b <=t2)
dfs<-dfa[d]
x <- strptime(paste(dfs$Date,dfs$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
Gap <- as.numeric(dfs$Global_active_power)
plot(x,Gap,type="l",ylab = "Global Active Power(kilowatts)",xlab = NA)
dev.copy(png,file="plot2.png")
dev.off()