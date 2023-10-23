setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")

#================ Trabalhando com o pacote Reshape ================

#instalando os pacotes
install.packages("reshape2")

#carregando a lib
library(reshape2)
#==================================================================

?reshape


#================ Carregando o Dataset ================

mtcars
#transposição da matriz
t(mtcars)


head(iris)
str(iris)
library(lattice)

#================ Distribuindo os dados Verticalmente ================
?reshape

iris_modif <- reshape(iris,
                      varying = 1:4,
                      v.names = "Medidas",
                      timevar = "Dimensões",
                      times = names(iris)[1:4],
                      idvar = "ID",
                      direction = "long")
head(iris_modif)
View(iris_modif)

bwplot(Medidas ~ Species | Dimensões, data = iris_modif)






