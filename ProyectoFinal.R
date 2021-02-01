#Poner ruta propia
covid <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/Covid.csv")
h1n1 <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/H1N1.csv")
ebola <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/ebola.csv")

#Cargar las librerias
install.packages("data.table")
install.packages("rgdal")
install.packages("leaflet")

library(dplyr)
library(ggplot2)
library(tidyverse)
library(sf)

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



