# Equipo 24 proyecto final

# Analisis de gravedad y letalidad de diversas pandemias a lo largo de la historia

_Conociendo la gravedad de la situación que vivimos en la actualidad, es de suma importancia analisar algunos detalles que han influenciado que esta pandemia y otras mas a lo largo de la historia han afectado a la humanidad y que relacion tienen entre ellas._

<img src="./images/pandemia.jpg" alt="Pandemia" width="450"/>

## Comenzando 🚀

_Puedes descargar el repositorio y consultar el codigo en lenguaje de programacipon R sobre el analisis realizado de las siguientes maneras:_

* Dando click en **Code** en el repositorio y despues **Download ZIP.
* Haciendo un **Git clone** del repositorio directamente en tu computadora 


### Pre-requisitos 📋

_Para poder observar en analisis, graficas y datos que se presentan en este proyecto, debes tener instalado el lñegunaje de programación R en tu ordenador, asi como cuañquier IDE que pueda soportar este lenguaje, te recomendamos "RStudio"_

_De igual forma debes se debe tener encuenta que se ocuparon data-sets de paginas como Kaggle, asi que es de suma iimportancia tener descargados estos data-sets para apreciar el analisis completo_

```
#Poner ruta propia
covid <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/coronavirus.csv")
h1n1 <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/H1N1.csv")
ebola <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/ebola.csv")
```

### Instalación 🔧

_Para el desarrollo del codigo se utilizaron ciertas librerias de R que facitaron el analisis y la extraccion de datos_

_Las librerias son las siguientes:_

```
#Cargar las librerias
library(dplyr)
library(ggplot2)
library(tidyverse)
library(sf)
library(treemap)
library(leaflet)
```

_Hay librerias que RStudio ya tiene pre-instaladas pero algunas de ellas tu las debes instalar, por ejemplo:_

```
install.packages("data.table")
install.packages("rgdal")
install.packages("leaflet")
install.packages("treemap")
```

_Con todo lo anterior contemplado, se puede correr el codigo y observar el analisis del proyecto._

## Desarrollo y Análisis de 3 enfermedades que han afectado a la humanidad en los ultimos 20 años  ⚙️

### <img src="./images/covid19.jpg" alt="Covid-19" width="80"/>  Analisis de la Pandemia Covid-19

_El principal enfoque del proyecto se basa en la comparacion de la actual pandemia Covid-19 respecto a otras graves enfermemdades, tanto en letalidad, alcance, afectaciones a la sociedad, entre muchos otros factores que se pueden analizar y asi poder entender su comportamiento, así como, el tiempo que tardo en propagarse a todo el mundo o la mayor parte de el y que paises fueron los mas afectos_



## Autores ✒️

_Este proyecto fue realizado por el equipo 24 del programa Santander-DataScience, cuyos sintegrantes son:_

* **Oscar Cañongo** - ** - [OscarCanongo](https://github.com/OscarCanongo)
* **Andres** - ** - [andresam0301](https://github.com/andresam0301)
* **Daniel Arellano** - ** - [Tachuelin](https://github.com/Tachuelin)




