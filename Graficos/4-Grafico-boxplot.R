getwd()

#Grafico estatistico boxplot

?boxplot
?sleep

#permite utilizar as colunas sem especificar o dataset

attach(sleep)

#construção do boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Duração do Sono",
                       col.main = "red", ylab = "Horas",
                       xlab = "Droga")
#calculo de média
medias = by(extra, group, mean)

#adicionando informações referente a media
points(medias, col= "red")

#criando o boxplot na horizontal
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Duração do Sono",
                       col.main = "red", ylab = "Horas",
                       xlab = "Droga", horizontal = T)

#colocando cores no boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = "Duração do Sono",
                       col.main = "red", ylab = "Horas",
                       xlab = "Droga", horizontal = T,
                       col = c("blue", "red"))

