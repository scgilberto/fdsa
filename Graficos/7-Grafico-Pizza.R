setwd("C:/Cursos/Cuso_DSA/Modulo4")
getwd()

#construção do Piechar
?pie
fatias = c(40,20,40)

#nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

paises = paste(paises, fatias)

#incluindo detalhes no label
paises = paste(paises, "%", sep = "")

colors()

#construindo o grafico.
pie(fatias, labels = paises,
    col = c("salmon4", "steelblue4", "springgreen4"),
    main = "Distribuição de Vendas")

#utilizando o dataset iris
attach(iris)
Values= table(Species)
labels = paste(names(Values))
pie(Values, labels = , main = "Distribuição de Especie")

#pacote 3d
install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.15,
      col = c("salmon4", "steelblue4", "springgreen4"),
      main= "Distribuição de Vendas")
