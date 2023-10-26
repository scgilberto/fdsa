#Exemplos do livro

#carregando o pacote de dados fligths

install.packages("nycflights13")

library(nycflights13)
library(tidyverse)

#criando novo objeto df
df <- flights


#conhecendo o df
str(df)
head(df)
tail(df)
View(df)
