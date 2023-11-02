#pacote data.table
setwd("c://Treinamentos//Formacao_DataScience//")
getwd()


#instalando o pacote data.table
install.packages('data.table')

#carregando lib
library(data.table)


#criando vetores
vec1 <- c(1,2,3,4)
vec2 <- c('Vermelho', 'Verde', 'Marrom','Laranja')

#criando o data.table
?data.table

dt1 <- data.table(vec1, vec2)
dt1

class(dt1)
str(dt1)
head(dt1)


#slicing do data.table

dt2 <- data.table(A = 1:9, B = c("Z", "W", "Q"), C = rnorm(9), D = T)
dt2
View(dt2)


#antes da virgula são as linhas
dt2[3:5,]

#depois da virgula são as colunas para visualização
dt2[,1:3]

#retornando todas as linhas e as colunas B e C
dt2[, .(B, C)]

#aplicando função ao data.table
dt2[, .(Total = sum(A), Mean = mean(C))]
dt2[plot(A, C)]

dt2[, .(MySum = sum(A)), by = .(Grp = A%%2)]


#definindo valores por grupos

dt3 <- data.table(B = c("a","b","c","d","e"),
                  val = as.integer(c(6:10, 1:5)))
dt3

#operações com o data.table

dt4 <- data.table(A = rep(letters[2:1], each = 4L),
                  B = rep(1:4 , each = 2L),
                  C = sample(8))
dt4

new_dt4 <- dt4[, sum(C), by = A]
new_dt4
class(new_dt4)
#ordena o objeto
new_dt4[order(A)]

new_dt4 <- dt4[, sum(B), by = A][order(A)]
new_dt4


#aplicando o dataset iris

dt5 <- as.data.table(iris)
dt5

dt5[, .(Sepal.Length = median(Sepal.Length),
       Sepal.Width = median(Sepal.Width),
       Petal.Length = median(Sepal.Length),
       Petal.Width = median(Sepal.Width)),
   by = Species]

print('----------------------------------')

#simplificando o codigo
dt5[, lapply(.SD, median),by = Species]

#o parametro SD significa Subset Data exclusivo do Data.table