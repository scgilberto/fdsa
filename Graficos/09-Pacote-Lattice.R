setwd("C:/treinamentos/fData_Science/f_DSA/Capo04/Graficos_GGP2")
getwd()


#pacote Lattice para visualuzação de dados alto nivel poderoso e elegante, com enfase em dados multivariados
#seu conceito é agrupar os dados e criar visualizações 


#instalando o pacote e carregando
install.packages('lattice')
library(lattice)

#grafico com lattice
#conjunto de dados iris
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

#conjunto de dados do titanic
?Titanic

#criando um barchart

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout= c(4,1),
         auto.key = list(title = "Dados Titanic", columns=2))

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4,1),
         auto.key = list(title = "Dados Titanic", coluns=2),
         scales = list(x = "free"))

#contagem de elementos
PetalLenght <- equal.count(iris$Petal.Length,4)
PetalLenght
#criando o scaterplot
xyplot(Sepal.Length~Sepal.Width | PetalLenght, data = iris)

#adicionando grid no grafico
xyplot(Sepal.Length~Sepal.Width | PetalLenght, data = iris,
       panel = function(...){
         panel.grid(h=-1, v = -1, col.line= "skyblue")
         panel.xyplot(...) })

#aplicando customização com modelo preditivo
xyplot(Sepal.Length~Sepal.Width | PetalLenght, data = iris,
       panel = function(x,y,...){
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})
       

#utilizando o histograma
histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout= c(3,1), type= "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")

#visualizando a distribuição dos dados
qqmath(~Sepal.Length | Species, data= iris, distribution = qunif)


#aplicando o boxplot
bwplot(Species~Sepal.Length, data = iris)

#criando o boxplot violino
bwplot(Species~Sepal.Length, data = iris,
       panel = panel.violin)
