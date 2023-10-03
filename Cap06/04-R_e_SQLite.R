setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap06")
getwd()

#intalando o SQLite
install.packages("RSQLite")
library(RSQLite)


#removendo caso ele exista
system("del exemplo.bd")

#criando o drive de conexao
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname= "exemplo.db")
dbListTables(con)

#criando uma tabel
dbWriteTable(con, "mtcars",mtcars, row.names = T)

dbListTables(con)
