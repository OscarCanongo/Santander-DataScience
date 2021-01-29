#Poner ruta propia
covid <- read.csv("~/Desktop/Santander-DataScience/Data/Covid.csv")
h1n1 <- read.csv("~/Desktop/Santander-DataScience/Data/H1N1.csv")
ebola <- read.csv("~/Desktop/Santander-DataScience/Data/ebola.csv")

#Cargar las librerias
install.packages("data.table")
install.packages("rgdal")
install.packages("leaflet")

library(dplyr)
library(ggplot2)
library(data.table)
library(rgdal)
library(leaflet)

#Limpiamos el dataset
COVID <-select(covid, pais = Country.Region, casos = totales) 

##Agrupamos por pais
Coronavirus <- COVID %>% 
                 group_by(pais) %>%                  # pais
                 summarise(totales = sum(casos)       # Sumamos los casos totales
               )

df_mapa<- readOGR("~/Desktop/Santander-DataScience/shp_mapa_paises_mundo_2014/Mapa_paises_mundo.shp")

