setwd("c:\\cursos\\Cuso_DSA\\praticando_dia_a_dia\\cap05")
getwd()
dir()


#Trabalhando com o pacote readr

library(readr)
?write.csv


#gravando dados em disco ds iris
write.csv(iris, "iris.csv")
dir()


df_iris <- read_csv("iris.csv",
                    col_types = list(
                      Sepal.Lenght = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Lenght = col_double(),
                      Petal.Width = col_double(),
                      Species = col_factor(c("setosa","versicolor","virginica"))
                    ))
View(df_iris)

str(df_iris)


#utilizando o pacote read.csv

df_iris2 <- read.csv("iris.csv")
View(df_iris2)
dim(df_iris2)
str(df_iris2)

#passando parametro
df_iris2 <- read.csv("iris.csv", stringsAsFactors = T)
dim(df_iris2)
View(df_iris2)
str(df_iris2)

#script para carregar varios arquivos

lista_arquivos <- list.files(getwd(), full.names = T, pattern = ".csv")
lista_arquivos

#loop para carregar os arquivos

lista_arquivo2 <- lapply(lista_arquivos, read_csv)

#caso tenha mais arquivos no mesmo formato ele unifica
