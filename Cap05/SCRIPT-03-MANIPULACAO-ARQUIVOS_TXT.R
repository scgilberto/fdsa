setwd("c:\\cursos\\Cuso_DSA\\praticando_dia_a_dia\\cap05")
getwd()
dir()


#gravando os arquivos importados em disco
?write.table

write.table(mtcars, file = 'mtcars.txt')
dir()

#passando parametros para a criação do delimitador.
write.table(mtcars, file = 'mtcars2.txt', sep = '|', col.names = NA, qmethod = "double")


#carregando sem passagem de paremetros
dfmtcars2 <- read.table("mtcars2.txt")
View(dfmtcars2)

#parametros de separação de colunas
dfmtcars2 <- read.table("mtcars2.txt", sep = '|')
View(dfmtcars2)

#parametro para o cabeçalho.
dfmtcars2 <- read.table("mtcars2.txt", sep = '|', header = T, encoding = 'UTF-8')

View(dfmtcars2)
