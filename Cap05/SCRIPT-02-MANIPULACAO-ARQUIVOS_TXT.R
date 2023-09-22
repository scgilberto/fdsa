setwd("C:\\Cursos\\Cuso_DSA\\praticando_dia_a_dia\\cap05")
getwd()
#capitulo 5 manipulando arquivos

#mostrando os pacotes carregado na seção

search()


?read.table


df1 <- read.table("arquivos_do_capitulo/arquivos/jogadores.txt")
df1
dim(df1)

#carga com parametros
df1 <- read.table("arquivos_do_capitulo/arquivos/jogadores.txt",
                  header = T,
                  sep = ',',
                  col.names = c("Var1","Var2","Var3"))

df1
dim(df1)

#carregue os dados e subtistua valores por NA
df2 <- read.table("arquivos_do_capitulo/arquivos/jogadores.txt",
                  header = T,
                  sep = ',',
                  col.names = c("Var1","Var2","Var3"),
                  na.strings = c("Tulio","Romario"))
df2

#carregando fatores

df3 <- read.table("arquivos_do_capitulo/arquivos/jogadores.txt",
                  header = T,
                  sep = ',',
                  col.names = c("Var1","Var2","Var3"),
                  na.strings = c("Zico","Maradon"),
                  stringsAsFactors = T)

df3


#utilizando a função head.csv

#sem parametros para importação.
df4 <- read.csv("arquivos_do_capitulo/arquivos/jogadores.txt")
df4
dim(df4)
