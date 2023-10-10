setwd("c:/cursos/Cuso_DSA/praticando_dia_a_dia/cap06/")
getwd()

#analise RFM

#instalação de bibliotecas
install.packages("caret")
install.packages("rfm")
install.packages("factoextra")



#carregando os dados
library(tidyverse)
library(dplyr)
library(ggplot2)
library(caret)
library(plotly)
library(readxl)
library(rfm)
library(stats)
library(factoextra)

#função para carregar os dados
carrega_dados <- function(){
  setwd("c:/cursos/Cuso_DSA/praticando_dia_a_dia/cap06/")
  sheet1 <- read_excel('online_retail_II.xlsx', sheet = 'Year 2009-2010')
  sheet2 <- read_excel('online_retail_II.xlsx', sheet = 'Year 2010-2011')
  dados_combinados <- rbind(sheet1,sheet2)
  return(dados_combinados)
}

#executando a função
dados <- carrega_dados()
dim(dados)
View(dados)

#função para verificar se existe valores ausesntes
verifica_missing <- function(x){
  return(data.frame(colSums(is.na(x))))
}

#aplicando a função
verifica_missing(dados)


#função para pre processar os dados
processa_dados <- function(data1){
  
  #criando a coluna TotalPrice
  data1$TotalPrice <- data1$Quantity * data1$Price
  
  #remove os registros de valores ausentes
  data1 <- na.omit(data1)
  
  #removendo as linhas das colunas quem contem a letra C (significa cancelado)
  data1 <- data1[!grepl("C",data1$Invoice),]
  
  return(data1)
  
}

dataset <- processa_dados(dados)
View(dataset)
dim(dataset)


#verificando a distribuição da variavel totalprice
ggplot(dataset,
       aes(x = TotalPrice)) + 
  geom_density(fill = "#69b3a2", color = "#e9ecef", alpha = 3.5) + 
  labs(title = "Distribuição da Variavel TotalPrice")

#verificando a quantidade de clientes
length(dataset$`Customer ID`)
length(unique(dataset$`Customer ID`))

#total monetario gasto por cliente

total_gasto <- dataset %>%
  group_by(`Customer ID`) %>%
  summarise(Sum = sum(TotalPrice))

View(total_gasto)


#Aplicando engenharia de atributos
#criando uma data customizada (Natal de 2011)
View(dataset)
max(dataset$InvoiceDate) #maior data "2011-12-09 12:50:00 UTC"
date1 = as.Date.character("25/12/2011","%d/%m/%Y")

#função para conversão de datas.
converte_data <-function(x){
  options(digits.secs = 3)
  return(as.Date(as.POSIXct(x$InvoiceDate, 'GMT')))
  
}

#executando a função
dataset$InvoiceDate <-converte_data(dataset)
View(dataset)



#função para calcular o RFM

calcula_rfm <- function(x){
  z <- x %>% group_by(`Customer ID`) %>% 
    summarise(Recency = as.numeric(date1 - max(InvoiceDate)), 
              Frequency = n(), 
              Monetary = sum(TotalPrice),
              primeira_compra = min(InvoiceDate))
  
  # Removendo transações com valores acima do 3º Quartil e abaixo do Quartil 1 (removendo outliers)
  Q1 <- quantile(z$Monetary, .25)
  Q3 <- quantile(z$Monetary, .75)
  IQR <- IQR(z$Monetary)
  z <- subset(z, z$Monetary >= (Q1 - 1.5*IQR) & z$Monetary <= (Q3 + 1.5*IQR))
  return(z)
}

valores_rfm <- calcula_rfm(dataset)
View(valores_rfm)
