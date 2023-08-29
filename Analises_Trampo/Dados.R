#carregando dados no RStudio
setwd("C:/Data_Analytics/excel/Analises_R")
getwd()

#instalando a lib para carregar o excel
install.packages("readxl")

#carregando a lib Excel
library('readxl')

Df_fechamento <- read_xlsx("C:/Data_Analytics/excel/Analises_R/Base_Fechamento online.xlsx")
View(Df_fechamento)


install.packages("dplyr")
library(dplyr)


# Filtragem das datas para o dia 15 de agosto de 2023
dados_filtrados <- Df_fechamento %>%
  filter(Df_fechamento$`Data entrega` == as.Date("2023-08-28"))

View(dados_filtrados)






plot(dados_filtrados$`QTD PACOTES`, dados_filtrados$`FRETE ROTA`,
     xlab = "Qtde de Pacotes",
     ylab = "Frete Frota",
     main = "Pacotes e Custos")


boxplot(df_teste_1$`QTD PACOTES`, col="red")
