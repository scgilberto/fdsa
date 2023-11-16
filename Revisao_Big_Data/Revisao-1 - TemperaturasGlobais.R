setwd("C:/Cursos/Cuso_DSA/Revisao_BIGDATA/TemperaturasGlobais/")
#local do arquivo
#https://drive.google.com/file/d/1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa/view

#carregando as libs
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#carregando o arquivo de temperaturas globais 8.5 Milhoes de registros

system.time(df_teste1 <- read.csv2("TemperaturasGlobais.csv"))
#tempo decorrido -> 27.46s

#utilizando o read.table
system.time(df_1 <- read.table("TemperaturasGlobais.csv"))
#tempo decorrido ->  11.25s
#nesta função a read.table carregou em menos tempo, mas aumentou o numero de linhas

#utilizando o comando head para visualizar as primeiras linhas, podemos verificar que
#o separador de colunas não foi identificado, com isso gerando mais linhas para o dataset

head(df_2)


#utilizando o fread
?fread

system.time(df_3 <- fread("TemperaturasGlobais.csv"))
#tempo decorrido -> 3.81s
#execução mais rapida com menos recurso computacional
# a função fread foi otimizada para grandes cargas de dados
# com isso o usuário pode carregar dados mais rapidos e criar analiese e 
# entregar suas informações para os tomadores de decisão mais rapido.
#


#criando um subset de dados
cidadesBrasil <- subset(df_teste3, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
nrow(df_teste3)
nrow(cidadesBrasil)
dim(cidadesBrasil)

#preparando e organizando
View(cidadesBrasil)
cidadesBrasil$dt <-  as.POSIXct(cidadesBrasil$dt, format= '%Y-%m-%d')
cidadesBrasil$Month <-  month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)

#criando subsets

#sao paulo
p_sp <- subset(cidadesBrasil, City == 'São Paulo')
p_sp <- subset(p_sp, Year %in% c(1796,1896,1946,1996,2012))
View(p_sp)

p_plm <- subset(cidadesBrasil, City == 'Palmas')
p_plm <- subset(p_plm, Year %in% c(1796,1896,1946,1996,2012))
head(p_plm)

p_crt <- subset(cidadesBrasil, City == 'Curitiba')
p_crt <- subset(p_crt, Year %in% c(1796,1896,1946,1996,2012))
head(p_crt)

#construção de plot

plot_sp <- ggplot(p_sp, aes(x = (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se = FALSE, fill= NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura média ao longo dos anos em São Paulo")+
  theme(plot.title = element_text(size = 18))

plot_plm <- ggplot(p_plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se = FALSE, fill= NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura média ao longo dos anos em Palmas")+
  theme(plot.title = element_text(size = 18))

plot_crtb <- ggplot(p_crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year)))+
  geom_smooth(se = FALSE, fill= NA, size= 2)+
  theme_light(base_size = 20)+
  xlab("Mês")+
  ylab("Temperatura Média")+
  scale_color_discrete("")+
  ggtitle("Temperatura média ao longo dos anos em Curitiba")+
  theme(plot.title = element_text(size = 18))





plot_sp
plot_plm
plot_crtb
  



