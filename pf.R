#proyecto final R analisis del H1N1
setwd("C:/Users/Andrés/Documents/bedu/rdata/pf")
h1n1=read.csv("H1N1.csv")
covid=read.csv("Covid.csv")
ebola=read.csv("ebola_2014_2016_clean.csv")

#df_mapaCovid<- st_read("C:/Users/Andrés/Documents/GitHub/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")
#df_mapaH1N1<- st_read("C:/Users/Andrés/Documents/GitHub/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")
#df_mapaEbola<- st_read("C:/Users/Andrés/Documents/GitHub/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")

library(dplyr)
library(lubridate)
h1n1=h1n1%>%mutate(Date = lubridate::ymd(Date))
class(h1n1$Date)

#h1n1
h_dbd=h1n1%>%group_by(Date)%>%
  summarise(Casos=sum(Cumulative.no..of.cases),Muertes=sum(Cumulative.no..of.deaths)
            ,(length(Country)))
colnames(h_dbd)
names(h_dbd)[names(h_dbd) == "(length(Country))"] <- "Países"
names(h_dbd)[names(h_dbd) == "Date"] <- "Fecha"
h_dbd$pandemia<-c("H1N1")         
h_dbd$nth_day<-(h_dbd$Fecha-min(h_dbd$Fecha))

#ebola
ebola=ebola%>%mutate(Date = lubridate::ymd(Date))
names(ebola)
ebolaf=ebola%>%group_by(Date)%>%
  summarise(Casos=sum(Cumulative.no..of.confirmed..probable.and.suspected.cases),Muertes=sum(Cumulative.no..of.confirmed..probable.and.suspected.deaths)
            ,(length(Country)))
colnames(ebolaf)
names(ebolaf)[names(ebolaf) == "(length(Country))"] <- "Países"
names(ebolaf)[names(ebolaf) == "Date"] <- "Fecha"
ebolaf$pandemia<-c("Ebola")         
ebolaf$nth_day<-(ebolaf$Fecha-min(ebolaf$Fecha))

#Covid
names(covid)
v1<-c(names(covid[5:365]))
Fecha=mdy(sub("^X", "", v1))
length(v1)
covid[,5]
covid$X1.22.20
casos=covid%>%group_by(Country.Region)%>%summarise_at(v1,sum,na.rm=TRUE)
names(casos[1])
Países=c(colSums(casos[2:362] != 0))
Casos=c(colSums(casos[2:362]))
covidf=structure(list(Fecha,Países,Casos), .Names = c("Fecha", "Países","Casos"), class = "data.frame", row.names = c(NA, -361L))
covidf$pandemia<-c("Ebola")         
covidf$nth_day<-(covidf$Fecha-min(covidf$Fecha))
max(covidf$Países)
max(ebolaf$Países,na.rm = T)
max(h_dbd$Países,na.rm = T)

library(ggplot2)
df=data.frame(número_de_países=(c(max(covidf$Países),max(ebolaf$Países,na.rm = T),
                                  max(h_dbd$Países,na.rm = T))),Pandemia=c("Covid","Ebola","H1N1"))
p<-ggplot(data=df, aes(x=Pandemia, y=número_de_países, fill=Pandemia)) +
  geom_bar(stat="identity",width = .5)+theme_minimal()+
  geom_text(aes(label=número_de_países), vjust=1, size=5)+
  labs(x="Pandemia",y="número de países",title='Número de países infectados')+
  theme_bw()
p + coord_flip()

ck=filter(covidf,Casos>=1000)
ek=filter(ebolaf,Casos>=1000)
hk=filter(h_dbd,Casos>=1000)
head(ck)
head(ek)
head(hk)

df=data.frame(day=c(3,0,10),Pandemia=c("Covid","Ebola","H1N1"))
p<-ggplot(data=df, aes(x=Pandemia, y=day, fill=Pandemia)) +
  geom_bar(stat="identity",width = .5)+theme_minimal()+
  geom_text(aes(label=day, vjust=1, size=5))+
  labs(x="Pandemia",y="Número de dias",title='Número de dias para alcanzar los 1000 casos')+
  theme_bw()
p + coord_flip()

ck=filter(covidf,nth_day<=100)
ek=filter(ebolaf,nth_day<=100)
hk=filter(h_dbd,nth_day<=73)
head(ck)
head(ek)
head(hk)
