#praticando exercicios

#===========definindo o local dos arquivos===========
setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/DataFrames")

#===========verificando o local do arquivo===========
getwd()

#=========== Exercicios ===========
#=== 1 - Carregar um dataframe CSV e um Dataframe excel ===
dados_csv <- read.csv2("Dados.csv", header = TRUE, sep = ";", quote = "")

#visualizando os dados
View(dados_csv)

#comando de help
?read.csv2

#=== carregando o arquivo Excel ===
#=== instalação do pacote para leitura do excel ===
install.packages("readxl")

#=== carregando a lib ===
library(readxl)

dados_excel <- read_xlsx("Dados.xlsx",col_names = TRUE, progress = readxl_progress() )
View(dados_excel)

#utilização do HELP
?read_xlsx

#2 - Identificar as categorias das variaveis
str(dados_csv)
str(dados_excel)

#acessando a coluna
levels(dados_csv$Categoria.de.Produtos)
summary(dados_csv$Categoria.de.Produtos)
dados_csv$Estacao <- as.factor(dados_csv$Categoria.de.Produtos)
dados_csv


#3 - Converter Fatores, fazer em uma das colunas do DataFrame
#4 - Crie novas colunas no DataFrame
