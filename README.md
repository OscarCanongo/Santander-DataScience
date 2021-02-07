# Equipo 24 proyecto final

# Análisis de gravedad y letalidad de diversas pandemias y epidemias a lo largo de la historia

_Conociendo la gravedad de la situación que vivimos en la actualidad, es de suma importancia analizar algunos detalles que han influenciado que esta pandemia y otras más a lo largo de la historia han afectado a la humanidad y que relación tienen entre ellas._

<img src="./images/pandemia.jpg" alt="Pandemia" width="450"/>

## Comenzando 🚀

_Puedes descargar el repositorio y consultar el Código en lenguaje de programación R sobre el análisis realizado de las siguientes maneras:_

- Dando clic en **Code** en el repositorio y después **Download ZIP**..
- Haciendo un **Git clone** del repositorio directamente en tu computadora

### Prerrequisitos 📋

_Para poder observar en análisis, gráficas y datos que se presentan en este proyecto, debes tener instalado el lenguaje de programación R en tu ordenador, así como cualquier IDE que pueda soportar este lenguaje, te recomendamos "RStudio"_

_De igual forma debes se debe tener en cuenta que se ocuparon data-sets de páginas como Kaggle, así que es de suma importancia tener descargados estos data-sets para apreciar el análisis completo_

```
#Poner ruta propia
covid <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/coronavirus.csv")
h1n1 <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/H1N1.csv")
ebola <- read.csv("C:/Users/end user/OneDrive/Escritorio/Santander-DataScience/Data/ebola.csv")
```

### Instalación 🔧

_Para el desarrollo del Código se utilizaron ciertas librerías de R que facilitaron el análisis y la extracción de datos_

_Las librerías son las siguientes:_

```
#Cargar las librerias
library(dplyr)
library(ggplot2)
library(tidyverse)
library(sf)
library(treemap)
library(leaflet)
```

_Hay librerías que RStudio ya tiene preinstaladas pero algunas de ellas tú las debes instalar, por ejemplo:_

```
install.packages("data.table")
install.packages("rgdal")
install.packages("leaflet")
install.packages("treemap")
```

_Con todo lo anterior contemplado, se puede correr el Código y observar el análisis del proyecto._

## Desarrollo y Análisis de 3 enfermedades que han afectado a la humanidad en los últimos 20 años ⚙️

### <img src="./images/covid19.jpg" alt="Covid-19" width="80"/> Análisis de la Pandemia Covid-19 ⚙️

_El principal enfoque del proyecto se basa en la comparación de la actual pandemia Covid-19 respecto a otras graves enfermedades, tanto en letalidad, alcance, afectaciones a la sociedad, entre muchos otros factores que se pueden analizar y así poder entender su comportamiento, así como, el tiempo que tardo en propagarse a todo el mundo o la mayor parte de él y que países fueron los más afectados_

_El o la COVID-19 (acrónimo del inglés coronavirus disease 2019), covid-19 o covid, conocida en español como enfermedad por coronavirus 2019 e incorrectamente como neumonía por coronavirus, es una enfermedad infecciosa causada por el virus SARS-CoV-2._

_Produce síntomas similares a los de la gripe o catarro, entre los que se incluyen fiebre, tos,  disnea, mialgia y fatiga. En casos graves se caracteriza por producir neumonía, síndrome de dificultad respiratoria aguda,15 sepsis16 y choque séptico que conduce a cerca de 3,75 % de los infectados a la muerte según la OMS. No existe tratamiento específico; las medidas terapéuticas principales consisten en aliviar los síntomas y mantener las funciones vitales._

* _El primer análisis que podemos hacer sobre esta enfermedad es los casos totales que se tienen en todo el mundo, especificando estos datos en un mapa mundial para una mejor apreciación_

<img src="./images/map_covid.png" alt="Mapa de casos de covid19 nivel mundial" width="650"/>

* _Para observar de forma aún más detallada y precisa para observar que países son los que más casos de covid tienen, se realizó un Tree Map_

<img src="./images/casos_covid19.png" alt="Tree map de casos de covid" width="650"/>

### <img src="./images/influenzah1n1.jpg" alt="H1N1" width="80"/> Análisis de la Pandemia Influenza H1N1 ⚙️

_La influenza virus A subtipo H1N1, más conocido como A H1N1 humana, es una especie de influenza virus tipo A del virus de la gripe, perteneciente a la familia de los Orthomyxoviridae._

_El H1N1 ha mutado en diversos subtipos que incluyen la gripe española (la de mayor fatalidad en los humanos, pero ya extinta en la vida silvestre), la gripe porcina, la gripe aviar y la gripe bovina. La cepa mantiene su circulación después de haber sido reintroducida por la población humana en los años 1970 (Gripe rusa de 1977)_

_Desde mediados de marzo de 2009, al menos 900 casos mortales han ocurrido en toda Europa y América por la pandemia de una cepa novedosa de H1N1, al menos otras 1000 muertes en México aún no están oficialmente confirmadas como casos de influenza H1N1, en el año 2013 y 2014 el gobierno de México dio la noticia de los nuevos casos de esta cepa del virus._

* _El primer análisis que podemos hacer sobre esta enfermedad es los casos totales que se tienen en todo el mundo, especificando estos datos en un mapa mundial para una mejor apreciación_

<img src="./images/map_h1n1.png" alt="Mapa de casos de influenza H1N1 nivel mundial" width="650"/>

* _Para observar de forma aún más detallada y precisa para observar que países son los que más casos de covid tienen, se realizó un Tree Map_

<img src="./images/casos_h1n1.png" alt="Tree map de casos de H1N1" width="650"/>


### <img src="./images/ebola.jpg" alt="Ebola" width="80"/> Análisis de la Epidemia de Ebola ⚙️

_El virus del Ébola1​ (Ebolavirus)​ es un género de virus de la familia Filoviridae que se detectó por primera vez en algunas regiones de África. La enfermedad que produce una fiebre hemorrágica viral de la misma categoría que la fiebre de Marburg, la fiebre de Lassa y la fiebre del dengue. Es el patógeno causante de la enfermedad del Ébola, una enfermedad infecciosa muy grave que afecta a los seres humanos._

_Este nombre proviene del río Ébola (en la República Democrática del Congo, antigua Zaire), donde fue identificado por primera vez en 1976 durante una epidemia con elevada tasa de mortalidad._

* _El primer análisis que podemos hacer sobre esta enfermedad es los casos totales que se tienen en todo el mundo, especificando estos datos en un mapa mundial para una mejor apreciación_

<img src="./images/map_ebola.png" alt="Mapa de casos de Ebola a nivel mundial" width="650"/>

* _Para observar de forma aún más detallada y precisa para observar que paises son los que más casos de covid tienen, se realizó un Tree Map_

<img src="./images/casos_ebola.png" alt="Tree map de casos de Ebola" width="650"/>


## Comparación y Análisis de las 3 enfermedades ⚙️

_Con toda la información obtenida anteriormente, se puede hacer un análisis más profundo entre las tres pandemias y poder realizar una hipótesis sobre alguna posible causa o inclusive es muy fácil determinar que los países mayormente poblados son los que más afectaciones tienen en este tipo de pandemias, tal es el caso de México, esto depende de muchas otras cuestiones como la población o manejo de estas situaciones como país particular, pero hablando en un ámbito general, esto es un pequeño ejemplo de los análisis a los que podemos llegar con toda la información que se recopilo en este proyecto_

* _Para iniciar, podemos determinar el origen de cada pandemia en los últimos años, esto es, donde se registró el primer caso, tal como se muestra a continuación:_

<img src="./images/origen_pandemias.png" alt="Mapa de origen de las pandemias en los ultimos años" width="750"/>

* _Para observarlo de una manera interactiva, da click [aquí](https://rpubs.com/Danielchon13/MapaOrigenes)_

_Un análisis rápido que se puede hacer, es la comparación entre los casos totales de cada pandemia anteriormente explicada, tal y como se muestra a continuación:_

<img src="./images/casos_acumulados.png" alt="Grafico de los casos acumulados de las 3 pandemias" width="550"/>

_Con lo anteriormente mostrado se puede deducir que la pandemia que mayor casos acumulados es Covid-19, esto es por su alto porcentaje de propagación e infección, así como factores tales como la globalización, esto es, en la actualidad los seres humanos estamos en constante movimiento, de un lugar a otro y de un país a otro, esto facilita aún más la propagación de este tipo de virus al resto del mundo._

_Para explicar mejor esto, se realizó un gráfico del número de países afectados por cada pandemia, tal y como se muestra a continuación:_

<img src="./images/paises_infectados.png" alt="Grafico del numero de paises infectados por cada pandemia" width="650"/>

_Finalmente, se puede analizar la rapidez con la que cada virus se propago y se propaga aun, con estos datos podemos predecir su comportamiento y las medidas que se pueden o se tuvieron que tomar para prevenir un contagio masivo como lo pudimos observar en algunos países incluyendo México._

_Este análisis comienza con el número de casos que cada pandemia tuvo en los primeros 100 días. A continuación se muestra el grafico que representa lo antes dicho:_

<img src="./images/casos_primeros_100dias.png" alt="Grafico del numero de casos en los primeros 100 dias de cada pandemia" width="650"/>

_También se puede determinar el número de países que cada pandemia afecto en los primeros 100 días, con esta información de igual forma se puede concluir que los países que fueron afectados en estos primeros días fue donde se originó y principalmente los países que se encontraban alrededor de el origen de cada virus, pero el número es importante ya que nos habla de la velocidad con la que se expande a un nivel global_

* _Grafico que representa lo anteriormente dicho:_

<img src="./images/paises_infectados_en100dias.png" alt="Grafico del numero de paises infectados en los primeros 100 dias" width="650"/>

_Para concluir y determinar que pandemia tuvo más impacto tanto por su porcentaje de letalidad, como su velocidad de propagación, se muestra un gráfico con los días que pasaron para llegar a 1000 casos en cada pandemia._

<img src="./images/pandemias.png" alt="Grafico del numero de dias para llegar a 1000 casos en cada pandemia" width="650"/>

_Todo este análisis nos hizo reflexionar en lo rápido que pueden cambiar muchas cosas que solíamos hacer comúnmente y como en tan poco tiempo muchas personas contrajeron estas enfermedades, de igual manera como es que todo esto influyo en muchísimos ámbitos tales como la economía, la tecnología, entre muchos más. Nos da un verdadero panorama de lo frágil e inestable que el ser humano y con la ayuda del análisis de datos podremos generar una herramienta para ayudar a prevenir que todo crezca más o prevenir futuras pandemias, saber cómo afrontarlas para disminuir en lo más mínimo la pérdida de vidas humanas._

## Autores ✒️

_Este proyecto fue realizado por el equipo 24 del programa Santander-DataScience, cuyos integrantes son:_

- **Oscar Cañongo** - \*\* - [OscarCanongo](https://github.com/OscarCanongo)
- **Andres** - \*\* - [andresam0301](https://github.com/andresam0301)
- **Daniel Arellano** - \*\* - [Tachuelin](https://github.com/Tachuelin)
