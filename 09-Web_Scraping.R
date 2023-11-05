setwd("c://Treinamentos//Formacao_DataScience//")
getwd()

#instalando os pacotes
install.packages("Rcurl")
install.packages("rvest")

#chart-layout-main-column
#ipc-metadata-list ipc-metadata-list--dividers-between sc-9d2f6de0-0 ckQYbL compact-list-view ipc-metadata-list--base



#carregando pacotes
library(rvest)
library(stringr)
library(dplyr)
library(lubridate)
library(readr)
library(tidyverse)


#carregado a pagina web
imdb <- read_html("https://www.imdb.com/chart/top/")
