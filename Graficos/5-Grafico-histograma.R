getwd()
#Histograma

?cars
#definindo valores para uma variavel
dados= cars$speed



hist(dados)
View(dados)

hist(dados, breaks = 10, main= "Histogramas das Velocidades") #aument as barras
hist(dados, labels= T, breaks = c(0,5, 10, 20, 30), main = "Histogramas da Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), main = "Histogramas de Velocidade")

#adicionando linhas ao grafico
grafico <- hist(dados, breaks = 10, main = "Histogramas da Velocidade")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados),sd = sd(dados))
yaxis = yaxis*diff(grafico$mids)*length(dados)

lines(xaxis, yaxis, col="red")
