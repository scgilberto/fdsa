setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")


#instalando as libs



#carregando as libs
library(tidyr)
library(ggplot2)


#criando um dataframe
dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)
dados

dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)


#criando ou DF

set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  work.T1 = runif(4),
  work.T1 = runif(4),
  work.T1 = runif(4)
)

df2

#fazendo o reshape no dataframe

df2_organizado1 <- df2 %>%
  gather(key,time, -id, -acao)

df2_organizado1 %>% head(8)

#reshape 2
df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.")
head(df2_organizado2) 


set.seed(1)
df3 <- data.frame(
  participante = c("p1","p2","p3","p4","p5","p6"),
  info = c("g1m","g1m","g1f","g2m","g2m","g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15),
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)
print(df3)

#fazendo o Reshape dos dados df3
df3 %>%
  gather(day, score, c(day1score, day2score))


#A função spread faz o reverso da gather
df3 %>%
  gather(day, score, c(day1score, day2score))%>%
  spread(day, score)

df3 %>%
  gather (day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2)
  

#Agrupando as colunas infoAgain, group, gender
df3 %>%
  gather (day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)





