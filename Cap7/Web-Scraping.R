setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")

#Web Scraping


#carregando as libs
library(rvest)
library(stringr)
library(tidyr)
library(dplyr)

pagina <-read_html ("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")

resultado <- html_nodes(pagina, "#detailed-forecast-body b  , .forecast-text")

#extraindo o texto da tag
texto <- html_text(resultado)
paste(texto, collapse = " ")


#extraindo dados
liga <- read_html("http://espn.go.com/nfl/superbowl/history/winners")

tabela <- html_nodes(liga, "table")
class(tabela)

tab <- html_table(tabela)[[1]]
View(tabela)

#Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas

#retirar as duas primeiras linhas anotação de slice
tab <- tab[-(1:2),]
View(tab)
#alterando o nome
names(tab)<- c("number", "date", "site", "result")
View(tab)

# Exercício 7 - Converta de algarismos romanos para números inteiros
tab$number <- 1:57
tab$date <- as.Date(tab$date, "%B. %d, %Y")









