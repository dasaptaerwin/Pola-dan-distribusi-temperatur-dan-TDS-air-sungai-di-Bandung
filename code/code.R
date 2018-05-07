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
install.packages('tidyverse') # for data manipulation and visualization
install.packages('tseries')   # for time series analysis
install.packages('gridExtra') # for panel/facet plotting
install.packages('forecast')
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

### TDS ###  -- OK

# CONVERT TO TIME SERIES OBJECT -- OK

## convert date and time as time series then put them in one column
data$combine <- as.POSIXct(paste(data$DATE, data$TIME_WIB), format="%Y-%m-%d %H:%M") 
data$combine

## convert tds data as time series object
data_cp$ts_tds <- ts(data_cp$TDS_PPM) # converting 
#number to time series class
data_phi$ts_tds <- ts(data_phi$TDS_PPM) # converting 
data_grp$ts_tds <- ts(data_grp$TDS_PPM) # converting 
class(data_cp$ts_tds)  # checking time series class


## convert temp river and temp air data as time series object
data_cp$ts.tempriver <- ts(data_cp$TEMP_RIVER_C)
data_cp$ts.tempair <- ts(data_cp$TEMP_AIR_C)
data_phi$ts.tempriver <- ts(data_phi$TEMP_RIVER_C)
data_phi$ts.tempair <- ts(data_phi$TEMP_AIR_C)
data_grp$ts.tempriver <- ts(data_grp$TEMP_RIVER_C)
data_grp$ts.tempair <- ts(data_grp$TEMP_AIR_C)

## plot histogram -- OK
ggplot(data=data_cp, aes(TEMP_AIR_C)) +
  geom_histogram(fill="blue") +
  geom_histogram(aes(TEMP_RIVER_C), fill="red") +
  labs(title = "Histogram temperatur udara (biru) vs air sungai (merah) Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Temperatur (oC)")

## plot histogram TDS ts -- OK
ggplot(data=data_cp, aes(TDS_PPM)) +
  geom_histogram(fill="blue") +
  labs(title = "Histogram TDS Air Sungai Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "TDS (ppm)")

## plot histogram temp river vs air -- OK
ggplot(data=data_cp, aes(x = data$combine)) +
  geom_line(aes(y = ts.tempriver), col="red") +
  geom_line(aes(y = ts.tempair), col="blue") +
  labs(title = "Temp air sungai dan temp udara Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "Temperatur (derajat C)") + theme(legend.position="bottom")

## plot temp air vs river ts -- OK
ggplot(data=data_cp, aes(x = ts.tempriver, y= ts.tempair)) +
  geom_point() +
  labs(title = "Temp air sungai vs temp udara Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Temperatur Air Sungai (oC)", y = "Temperatur Udara (oC)") 

## plot TDS as is

dev.off()
par(mfrow=c(3,1))

plot.ts(data_cp$TDS_PPM)
title(main="Plot TDS (ppm) Maret - November 2017 di lokasi CP", col.main="blue", font.main=4)

plot.ts(data_phi$TDS_PPM)
title(main="Plot TDS (ppm) Maret - November 2017 di lokasi PHI", col.main="blue", font.main=4)

plot.ts(data_grp$TDS_PPM)
title(main="Plot TDS (ppm) Maret - November 2017 di lokasi GRP", 
      col.main="blue")

plot.ts(data_grp$TDS_PPM, col='grey', ylim=c(60, 150))
lines(data_cp$TDS_PPM, col='red')
lines(data_phi$TDS_PPM, col='blue')

## plot TDS ts OK
ggplot(data=data_cp, aes(x = data$combine, y = ts_tds)) + geom_line() +
  labs(title = "Plot TDS air sungai Curug Panganten, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "TDS (ppm)")


ggplot(data=data_phi, aes(x = data$combine, y = ts_tds)) + geom_line() +
  labs(title = "Plot TDS air sungai PHI, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "TDS (ppm)")

ggplot(data=data_grp, aes(x = data$combine, y = ts_tds)) + geom_line() +
  labs(title = "Plot TDS air sungai GRP, Bandung",
       subtitle = "Maret-November 2017",
       x = "Bulan", y = "TDS (ppm)")

################## objects need to be adjusted ###############

# MOVING AVERAGE (MA)
ma_cp <- ma(data_cp$ts_tds, order=100) 
ma_phi <- ma(data_phi$ts_tds, order=100) ma_grp <- ma(data_grp$ts_tds, order=100) 

# DECOMPOSE (using forecast package). Don't forget to install and load forecast package
## ON TDS USING STL FUNCTION, ADDITIVE AND MULTIPLICATIVE
### location: CP 
tds_cp <- ts(data_cp$ts_tds, frequency=100) 
decompose_tds_cp_stl <- stl(tds_cp, s.window="periodic")
plot(decompose_tds_cp_stl, main = "Decomposition of time series CP")

decompose_tds_cp_mult <- decompose(tds_cp, "mult")
plot(as.ts(tds_cp))
plot(as.ts(decompose_tds_cp_mult$seasonal))
plot(as.ts(decompose_tds_cp_mult$trend))
plot(as.ts(decompose_tds_cp_mult$random))

decompose_tds_cp_add <- decompose(tds_cp, "additive")
plot(as.ts(tds_cp))
plot(as.ts(decompose_tds_cp_add$seasonal))
plot(as.ts(decompose_tds_cp_add$trend))
plot(as.ts(decompose_tds_cp_add$random))


### location: PHI
tds_phi <- ts(data_phi$ts_tds, frequency=100) 
decompose_tds_phi <- stl(tds_phi, s.window="periodic")
plot(decompose_tds_phi, main = "Decomposition of time series PHI")

decompose_tds_phi_mult <- decompose(tds_phi, "mult")
plot(as.ts(tds_phi))
plot(as.ts(decompose_tds_phi_mult$seasonal))
plot(as.ts(decompose_tds_phi_mult$trend))
plot(as.ts(decompose_tds_phi_mult$random))

decompose_tds_phi_add <- decompose(tds_phi, "additive")
plot(as.ts(tds_phi))
plot(as.ts(decompose_tds_phi_add$seasonal))
plot(as.ts(decompose_tds_phi_add$trend))
plot(as.ts(decompose_tds_phi_add$random))

### location: GRP
tds_grp <- ts(data_grpts_tds, frequency=100) 
decompose_tds_grp <- stl(tds_grp, s.window="periodic")
plot(decompose_tds_grp, main = "Decomposition of time series GRP")

decompose_tds_grp_mult <- decompose(tds_grp, "mult")
plot(as.ts(tds_grp))
plot(as.ts(decompose_tds_grp_mult$seasonal))
plot(as.ts(decompose_tds_grp_mult$trend))
plot(as.ts(decompose_tds_grp_mult$random))

decompose_tds_grp_add <- decompose(tds_grp, "additive")
plot(as.ts(tds_grp))
plot(as.ts(decompose_tds_grp_add$seasonal))
plot(as.ts(decompose_tds_grp_add$trend))
plot(as.ts(decompose_tds_grp_add$random))

# TESTING TStools package
devtools::install_github("trnnick/TStools")
library('TStools')
devtools::install_github("robjhyndman/forecast")
library('forecast')
source("https://github.com/trnnick/TStools/blob/master/R/cmav.R")

## Center moving average (cma from tstools pkg)
cmav(tds_cp, outplot=1)
cmav(tds_phi, outplot=1)
cmav(tds_grp, outplot=1)

seasplot(tds_cp, outplot = 4)
seasplot(tds_phi, outplot = 4)
seasplot(tds_grp, outplot = 4)

decomp(tds_cp,outplot=1)
decomp(tds_cp, outplot=1, type="pure.seasonal", h=360)
plot(stl(tds_cp, s.window=360))
acf(tds_cp,lag.max=36)
pacf(tds_cp,lag.max=36)




###################################
###################################
###################################
###################################

# DECOMPOSE TEMPERATURE (AIR AND RIVER) DATA 

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

