#setwd("D:/timsus")

library(tidyverse)
library(ggplot2)
library(zoo)
library(lubridate)
library(readxl)

db2<-read_excel("bmkg+ogimet.xlsx")
#db2<- db[c(1,2,4)]


colnames(db2) = c("date","Tn","Tx","Tavg", "RH_avg","ch","ss","ff_avg")
db2$date=as.Date(db2$date, format = "%d/%m/%Y")

db2$day=as.numeric(format(db2$date, '%d'))
db2$mo=as.numeric(format(db2$date, "%m"))
db2$yr=as.numeric(format(db2$date, "%Y"))

db2=db2%>% group_by(mo,day) %>% mutate(Tn=na.approx(Tn, na.rm=F))%>%
  ungroup()%>% mutate(Tn=na.approx(Tn,na.rm=F))
db2$Tn[is.na(db2$Tn)]=mean(db2$Tn, na.rm=T)

db2=db2%>% group_by(mo,day) %>% mutate(Tx=na.approx(Tx, na.rm=F))%>%
  ungroup()%>% mutate(Tx=na.approx(Tx,na.rm=F))
db2$Tx[is.na(db2$Tx)]=mean(db2$Tx, na.rm=T)

db2=db2%>% group_by(mo,day) %>% mutate(Tavg=na.approx(Tavg, na.rm=F))%>%
  ungroup()%>% mutate(Tavg=na.approx(Tavg,na.rm=F))
db2$Tavg[is.na(db2$Tavg)]=mean(db2$Tavg, na.rm=T)

db2=db2%>% group_by(mo,day) %>% mutate(RH_avg=na.approx(RH_avg, na.rm=F))%>%
  ungroup()%>% mutate(RH_avg=na.approx(RH_avg,na.rm=F))
db2$RH_avg[is.na(db2$RH_avg)]=mean(db2$RH_avg, na.rm=T)

db2$ch[db2$ch>320|db2$ch<0]=NA
db2$ch[is.na(db2$ch)]=0

db2=db2%>% group_by(mo,day) %>% mutate(ss=na.approx(ss, na.rm=F))%>%
  ungroup()%>% mutate(ss=na.approx(ss,na.rm=F))
db2$ss[is.na(db2$ss)]=mean(db2$ss, na.rm=T)

db2=db2%>% group_by(mo,day) %>% mutate(ff_avg=na.approx(ff_avg, na.rm=F))%>%
  ungroup()%>% mutate(ff_avg=na.approx(ff_avg,na.rm=F))
db2$ff_avg[is.na(db2$ff_avg)]=mean(db2$ff_avg, na.rm=T)

summary(db2)

db3<-db2[1:8]
summary(db3)

#install.packages("writexl")
library(writexl)
#library(xlsx)

write_xlsx(db3, "D:/skripsi/OLAHDATA/8feb2024/dailycorrected.xlsx")


####INTERPOLASI DARI DATA SEBELUM DAN SESUDAH#####
db2<-read_excel("alldaily.xlsx")

#colnames(db2) = c("Tanggal","ss")
#db2$date=as.numeric(db2$Tanggal, format = "%Y")

# Fungsi untuk mengisi data kosong dengan rata-rata data sebelum dan setelah
fill_missing_with_avg <- function(data) {
  for (i in 2:(length(data) - 1)) {
    if (is.na(data[i])) {
      # Cari indeks data sebelum dan setelah yang tidak kosong
      before_index <- i - 1
      after_index <- i + 1
      
      # Hitung rata-rata dari data sebelum dan setelah
      avg_value <- mean(c(data[before_index], data[after_index]), na.rm = TRUE)
      
      # Isi data kosong dengan nilai rata-rata
      data[i] <- avg_value
    }
  }
  return(data)
}

# Asumsikan kolom yang akan diisi adalah kolom pertama
data = db2
data$Tn <- fill_missing_with_avg(data$Tn)
data$Tx <- fill_missing_with_avg(data$Tx)
data$Ta <- fill_missing_with_avg(data$Ta)
data$RH <- fill_missing_with_avg(data$RH)
data$RR <- fill_missing_with_avg(data$RR)
data$ss <- fill_missing_with_avg(data$ss)
data$ff <- fill_missing_with_avg(data$ff)

write_xlsx(data, "D:/skripsi/OLAHDATA/cil/alldailycorrected.xlsx")
