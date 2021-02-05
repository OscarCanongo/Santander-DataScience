#Poner ruta propia
covid <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/coronavirus.csv")
h1n1 <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/H1N1.csv")
ebola <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/ebola.csv")

#Cargar las librerias
install.packages("data.table")
install.packages("rgdal")
install.packages("leaflet")
install.packages("treemap")

library(dplyr)
library(ggplot2)
library(tidyverse)
library(sf)
library(treemap)
library(leaflet)

#Limpiamos el dataset
COVID <-select(covid, pais = Country.Region, casos = totales)

##Agrupamos por pais
Coronavirus <- COVID %>% 
                 group_by(pais) %>%                  # pais
                 summarise(totales = sum(casos)       # Sumamos los casos totales
               )

df_mapa<- st_read("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")
df_mapaH1N1<- st_read("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")
df_mapaEbola<- st_read("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/shp_mapa_paises_mundo_2014/Paises_Mundo.shp")

df_mapa %>%
  ggplot() + # Crea un objeto ggplot a partir del objeto mex_map
  geom_sf() # agrega una capa con el mapa

df_mapaH1N1 %>%
  ggplot() + # Crea un objeto ggplot a partir del objeto mex_map
  geom_sf() # agrega una capa con el mapa

df_mapaEbola %>%
  ggplot() + # Crea un objeto ggplot a partir del objeto mex_map
  geom_sf() # agrega una capa con el mapa

df_mapa

map_covid <- df_mapa %>%
  # unir tablas
  left_join(Coronavirus,
            # indicar explícitamente las columnas índice,
            # necesario cuando no tienen el mismo nombre
            by = c("PAÍS" = "pais"))

map_h1n1 <- df_mapaH1N1 %>%
  # unir tablas
  left_join(h1n1,
            # indicar explícitamente las columnas índice,
            # necesario cuando no tienen el mismo nombre
            by = c("PAÍS" = "pais"))

map_ebola <- df_mapaEbola %>%
  # unir tablas
  left_join(ebola,
            # indicar explícitamente las columnas índice,
            # necesario cuando no tienen el mismo nombre
            by = c("PAÍS" = "pais"))

map_covid %>%
  # usamos el aesthetic fill para indicar la columna de casos
  ggplot(aes(fill = totales)) +
  geom_sf()

map_h1n1 %>%
  # usamos el aesthetic fill para indicar la columna de casos
  ggplot(aes(fill = totales)) +
  geom_sf()

map_ebola %>%
  # usamos el aesthetic fill para indicar la columna de casos
  ggplot(aes(fill = totales)) +
  geom_sf()

#Tree maps
# Coronavirus
p <- treemap(Coronavirus,
             index=c("pais"),
             vSize="totales",
             type="index",
             palette = "Set2",
             bg.labels=c("white"),
             align.labels=list(
               c("center", "center"), 
               c("right", "bottom")
             )  
)

# H1N1
p <- treemap(h1n1,
             index=c("pais"),
             vSize="totales",
             type="index",
             palette = "Set2",
             bg.labels=c("white"),
             align.labels=list(
               c("center", "center"), 
               c("right", "bottom")
             )  
)

# Ebola
p <- treemap(ebola,
             index=c("pais"),
             vSize="totales",
             type="index",
             palette = "Set2",
             bg.labels=c("white"),
             align.labels=list(
               c("center", "center"), 
               c("right", "bottom")
             )  
)

#Paises en donde la epidemia comenzó
longitud <-c(-96.95, 114.02, -10.05, 111.24, 100.55, 38.65, 30.05)
latitud <- c(19.54,30.56, 8.61,22.85, 4.11, 21.45, 1.37)
color <- c("red", "red", "red", "blue", "blue", "blue", "blue")
tamano <- c(300, 300, 300, 300, 300, 300, 300)
titulo <- c("H1N1 - Veracruz, México", "COVID 19 - Wuhan, China", "Ebola - Meliandou, Guinea", "SARS - Guangdong, China", "NIPHA - Malasia", "MERS - Jeddah, Arabia Saudita", "Zika - Uganda")
df <- data.frame(longitud, latitud, color, tamano, titulo)
leaflet(df, options = leafletOptions(Zoom = -10, maxZoom = 8)) %>% addTiles() %>%
  addCircles(lng = ~longitud, lat = ~latitud, weight = 1, color=~color,
             radius = ~tamano * 3000, popup = ~titulo
  )

#Casos confirmados acumulados

#Sumamos casos acumulados
totalesCovid <- sum(Coronavirus$totales)
totalesebola <- sum(ebola$totales)
totalesh1n1 <- sum(h1n1$totales)

df1 <- data.frame()

covidD <- data.frame(Enfermedad="Coronavirus", Totales = totalesCovid)
h1n1D <- data.frame(Enfermedad="H1n1", Totales = totalesh1n1)
ebolaD <- data.frame(Enfermedad="Ebola", Totales = totalesebola)

df1 <- rbind(df1, covidD)
df1 <- rbind(df1, ebolaD)
df1 <- rbind(df1, h1n1D)


ggplot(df1, aes(x=Enfermedad, y=Totales)) + 
  geom_bar(stat = "identity", fill = "#779ECB") +
  coord_flip() 