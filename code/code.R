# Time Series R code
# Adapted from: Ryan Womack's code and tutorial (https://www.youtube.com/watch?v=QHsmAM6nktY)
# Revised 2017-02-19
<<<<<<< HEAD
# Written to analyse time series data from Cikapundung River (taken by Sri Aditya)
=======
>>>>>>> 301e40f633e42a9f729bda64e0f1835f8e0d8700


# README: data time series ini diukur di tiga lokasi, pada masing-masing lokasi pengukuran dilakukan 4 kali sehari, dua kali seminggu, selama 8 bulan di tahun 2017.

# INSTALL LIBRARY (DO THIS ONCE)
install.packages('lubridate') # for date manipulation
isntall.packages('tidyverse') # for data manipulation and visualization
install.packages('forecast')  # for forecast and time series analysis
install.packages('tseries')   # for time series analysis
install.packages('gridExtra') # for panel/facet plotting
#install.packages('ggfortify')


# LOAD LIBRARY (LOAD EVERYTIME YOU OPEN THIS CODE)
library('lubridate')
library('tidyverse')
library('forecast')
library('tseries')
library('gridExtra')
library('ggfortify')

# LOAD DATA (REFORMAT YOUR DATA INTO TABULAR FORMAT)
data<-read.csv('data.csv')
data_cp<-read.csv('data_cp.csv')
data_phi<-read.csv('data_phi.csv')
data_grp<-read.csv('data_grp.csv')

# CURUG PANGANTEN DATA

### TDS ###
# CONVERT TO TIME SERIES OBJECT OK
data$combine <- as.POSIXct(paste(data$DATE, data$TIME_WIB), format="%Y-%m-%d %H:%M") # combining date and time into a column
data$combine

data$ts_tds_cp <- ts(data$TDS_PPM) # converting 
#number to time series class
data$ts_tds_phi <- ts(data_phi$TDS_PPM) # converting 
data$ts_tds_grp <- ts(data_grp$TDS_PPM) # converting 


class(data$ts_tds_cp)  # checking time series class
data$ts.tempriver <- ts(data$TEMP_RIVER_C)
class(data$ts.tempriver)
data$ts.tempair <- ts(data$TEMP_AIR_C)
class(data$ts.tempair)

## plot histogram OK
ggplot(data=data, aes(data$TEMP_AIR_C)) +
  geom_histogram(fill="blue") +
  geom_histogram(aes(data$TEMP_RIVER_C), fill="red") +
  labs(title = "Histogram temperatur udara (biru) vs air sungai (merah) Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Temperatur (oC)")

## plot histogram TDS ts OK
ggplot(data=data, aes(data$TDS_PPM)) +
  geom_histogram(fill="blue") +
  labs(title = "Histogram TDS Air Sungai Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "TDS (ppm)")

## plot histogram temp river vs air OK
plot(data$ts.tempriver)
ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = data$ts.tempriver), col="red") +
  geom_line(aes(y = data$ts.tempair), col="blue") +
  labs(title = "Temp air sungai dan temp udara Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "Temperatur (derajat C)") + theme(legend.position="bottom")

## plot temp air vs river ts OK
ggplot(data=data, aes(x = data$TEMP_RIVER_C, y=data$TEMP_AIR_C)) +
  geom_point() +
  labs(title = "Temp air sungai vs temp udara Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Temperatur Air Sungai (oC)", y = "Temperatur Udara (oC)") 

## plot TDS ts OK
ggplot(data=data, aes(x = data$combine, y = data$ts.tds)) + geom_line() +
  labs(title = "Plot TDS air sungai Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "TDS (ppm)")

# MOVING AVERAGE (MA)
data$tdsma7 <- ma(data$ts.tds, order=7)   # orde mingguan (7 hari)
data$tdsma30 <- ma(data$ts.tds, order=30) # orde bulanan (30 hari)
data$tdsma100 <- ma(data$ts.tds, order=100) # orde bulanan (100 hari)
data$tempriverma7 <- ma(data$ts.tempriver, order=7)
data$tempriverma30 <- ma(data$ts.tempriver, order=30)
data$tempairma7 <- ma(data$ts.tempair, order=7)
data$tempairma30 <- ma(data$ts.tempair, order=30)

# CLEAN MISSING VALUES IN MA RESULTS
data$tdsma7 <- tsclean(data$tdsma7)
data$tdsma30 <- tsclean(data$tdsma30)
data$tdsma100 <- tsclean(data$tdsma100)
data$tempriverma7 <- tsclean(data$tempriverma7)
data$tempriverma30 <- tsclean(data$tempriverma30)
data$tempairma7 <- tsclean(data$tempairma7)
data$tempairma30 <- tsclean(data$tempairma30)

# PLOTTING MA RESULTS TDS USING BASE PLOT OK
date <- as.Date(data$DATE)

plot(data$ts.tds, col="grey", 
     main = "Plot data TDS dan hasil moving average pada berbagai orde",
     ylab = "TDS (ppm)")
lines(data$tdsma7, col="red")
lines(data$tdsma30, col="blue")
lines(data$tdsma100, col="black", lwd=2)
legend("topleft", legend=c("data", "MA orde 7", "MA orde 30", "MA orde 100"),
       col=c("grey", "red", "blue", "black"), lty=1, cex=0.6)


## CREATING THE SAME MA PLOT USING GGPLOT2
ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = data$ts.tds, colour="data")) +
  geom_line(aes(y = data$tdsma7, colour="MA orde 7")) +
  geom_line(aes(y = data$tdsma30, colour="MA orde 30")) +
  geom_line(aes(y = data$tdsma100, colour="MA orde 100")) +
  labs(title = "Plot data TDS dan hasil moving average pada berbagai orde",
       x = "Bulan", y = "TDS data (ppm)",
       subtitle = "Maret-November 2017", 
       ylim(60, 70)) +
  theme_minimal() +
  scale_color_manual(values = c("grey", "red", "blue", "black"))

# DECOMPOSE
## ON TDS USING STL FUNCTION (WE USE PREVIOUS MA OBJECT)
tds_ma <- ts(data$tdsma7, frequency=100) #OK. WE HAVE REMOVED THE NAS USING TSCLEAN FUNCTION
decompose_tds_stl <- stl(tds_ma, s.window="periodic")
plot(decompose_tds_stl, main = "Decomposition of STL time series")

## ON TDS USING DECOMPOSE FUNCTION ADDITIVE
decompose_tds_add <- decompose(tds_ma, "additive")
plot(as.ts(decompose_tds_add$seasonal))
plot(as.ts(decompose_tds_add$trend))
plot(as.ts(decompose_tds_add$random))
plot(decompose_tds_add)

dev.off()

decompose_tds_add$seasona <- tsclean(decompose_tds_add$seasona)
decompose_tds_add$trend <- tsclean(decompose_tds_add$trend)
decompose_tds_add$random <- tsclean(decompose_tds_add$random)

p1 <- ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = data$ts.tds))+
  xlab('month') + ylab('seasonal')

p2 <- ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = decompose_tds_add$seasonal))+
  xlab('month') + ylab('tds data')
            
p3 <- ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = decompose_tds_add$trend))+
  xlab('month') + ylab('trend')

p4 <- ggplot(data=data, aes(x = data$combine)) +
  geom_line(aes(y = decompose_tds_add$random))+
  xlab('month') + ylab('random/noise')

grid.arrange(p1,p2,p3,p4,ncol=1)

## ON TDS USING DECOMPOSE FUNCTION MULTIPLICATIVE OK
decompose_tds_mult <- decompose(tds_ma, "mult")
decompose_tds_add <- decompose(tds_ma, "additive")
plot(as.ts(decompose_tds_mult$seasonal))
plot(as.ts(decompose_tds_mult$trend))

### evaluating multiplicative vs additive OK
par(mfrow=c(2,1))
plot(as.ts(decompose_tds_mult$random))
plot(as.ts(decompose_tds_add$random))

## results: we don't see any difference between decompose additive vs multiplicative OK

tds_ma <- ts(na.omit(data$tdsma30), frequency=30)
decomp <- stl(tds_ma, s.window="periodic")
deseasonal <- seasadj(decomp)
plot(decomp)

## TEMPRIVER (tidak digunakan pasti seasonal)
### orde 100
tempriver_ma <- ts(na.omit(data$tempriverma7), frequency=100) #OK
decomp_tempriver <- stl(tempriver_ma, s.window="periodic")
deseasonal <- seasadj(decomp_tempriver)
plot(decomp_tempriver)

# orde 30
tempriver_ma <- ts(na.omit(data$tempriverma30), frequency=30)
decomp_tempriver30 <- stl(tempriver_ma, s.window="periodic")
deseasonal <- seasadj(decomp_tempriver30)
plot(decomp_tempriver30)

## TEMPAIR
### orde 100
tempair_ma <- ts(na.omit(data$tempairma7), frequency=100)
decomp_tempair <- stl(tempair_ma, s.window="periodic")
deseasonal <- seasadj(decomp_tempair)
plot(decomp_tempair)

### orde 30
tempair_ma <- ts(na.omit(data$tempairma30), frequency=30)
decomp_tempair30 <- stl(tempair_ma, s.window="periodic")
deseasonal <- seasadj(decomp_tempair30)
plot(decomp)

# CORRELATIONS
ts.plot(data$ts.tds)
ts.plot(data$tdsma7)
ts.plot(data$tdsma30)
ts.plot(data$ts.tds, data$tdsma7, data$tdsma30, col=c("green", "blue", "red"))
ts.plot(data$ts.tds, data$ts.tempriver, col=c("green", "blue"))
dev.off()

dev.off()
par(mar = c(5, 5, 3, 5))
plot(data$ts.tds, type ="l", ylab = "TDS (ppm)",
     main = "TDS and Temp Air", xlab = "Time",
     col = "blue")
par(new = TRUE)
plot(data$TEMP_RIVER_C, type = "l", xaxt = "n", yaxt = "n",
     ylab = "", xlab = "", col = "red", lty = 2)
axis(side = 4)
mtext("Temp Air (oC)", side = 4, line = 3)
legend("topleft", c("TDS", "Temp Air"),
       col = c("blue", "red"), lty = c(1, 2))

par(mar = c(5, 5, 3, 5))
plot(data$ts.tds, type ="l", ylab = "TDS (ppm)",
     main = "TDS and Temp Air", xlab = "Time",
     col = "blue")
par(new = TRUE)
plot(data$TEMP_RIVER_C, type = "l", xaxt = "n", yaxt = "n",
     ylab = "", xlab = "", col = "red", lty = 2)
axis(side = 4)
mtext("Temp Air (oC)", side = 4, line = 3)
legend("topleft", c("TDS", "Temp Air"),
       col = c("blue", "red"), lty = c(1, 2))

#################################################################
#################################################################


# begin testing xts 
decomp_tds <- ets(tds_ma)
plot(decomp_tds$states)
install.packages('xts')
library('xts')
plot(as.xts(decomp_tds))
deseasonal <- seasadj(decomp)
plot(decomp)
# end testing xts

# begin testing forecast
#install.packages("fpp")
#library(fpp)
data(ausbeer)
timeserie_beer = tail(head(ausbeer, 17*4+2),17*4-4)
plot(as.ts(timeserie_beer))
#install.packages("forecast")
#library(forecast)
trend_beer = ma(timeserie_beer, order = 4, centre = T)
plot(as.ts(timeserie_beer))
lines(trend_beer)
plot(as.ts(trend_beer))
detrend_beer = timeserie_beer - trend_beer
plot(as.ts(detrend_beer))

decompose_beer = decompose(ts_beer, "additive")

plot(as.ts(decompose_beer$seasonal))
plot(as.ts(decompose_beer$trend))
plot(as.ts(decompose_beer$random))
plot(decompose_beer)

## more decompose lines
trend_tds <- ma(data$ts.tds, order = 10, centre = T)
trend_tds100 <- ma(data$ts.tds, order = 100, centre = T)
trend_tds30 <- ma(data$ts.tds, order = 30, centre = T)
trend_tds20 <- ma(data$ts.tds, order = 20, centre = T)
plot(as.ts(data$ts.tds), col="grey")
lines(trend_tds, col="red")
lines(trend_tds100, col="blue")
lines(trend_tds30, col="green")
lines(trend_tds20, col="black")
detrend_tds <- data$ts.tds - trend_tds
plot(as.ts(detrend_tds))

decompose_tds <- decompose(tds_ma, "additive")
plot(as.ts(decompose_tds$seasonal))
plot(as.ts(decompose_tds$trend))
plot(as.ts(decompose_tds$random))
plot(decompose_tds)

# end testing forecast


