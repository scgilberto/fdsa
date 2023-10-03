setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap06")
getwd()

install.packages("dbplyr")

#carregando libs
library(RPostgres)
library(dbplyr)
library(dplyr)
library(ggplot2)
library(DBI)
?DBI

?dbConnect

#area de conexao com o bd
conn = dbConnect(
  Postgres(),
  user = "postgres",
  password = "8ZFT84dx#9FGc%em",
  dbname = "db_treinamentos",
  host = "localhost"
)
#QUERY
qry <- "select pclass, survived, avg(cast(replace(age,',','.')as numeric)) as media_idade from titanic where (cast(replace(age,',','.')as numeric)) = 1 group by pclass, survived
;"
#executando a query
dbGetQuery(conn, qry)


#plot
dados <- dbGetQuery(conn, qry)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")
