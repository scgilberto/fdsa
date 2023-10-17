setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")

#=======================Manipulação e limpeza de dados#=======================

#carregando as lib
library(dplyr)
library(readr)


#carregando o arquivo
?read_csv

df_sono <- read_csv('sono.csv', show_col_types = F) 
View(df_sono)

head(df_sono)
tail(df_sono)
class(df_sono)
str(df_sono) #resumo completo com todo tipo de dado
glimpse(df_sono)

#aplicando o mutate
glimpse(mutate(df_sono, peso_libras = sono_total / 0.45359237))


#contagem e histograma
count(df_sono, cidade)
hist(df_sono$sono_total)

#amostra dentro do dataframe.
sample_n(df_sono, size = 10)



#trabalhando com select()
sleepData <- select(df_sono, nome, sono_total)
sleepData

head(sleepData)
View(sleepData)
class(sleepData)
select(df_sono, nome)

#Retornando um range de colunas
select (df_sono, nome:sono_total)

#utilizando o Filter()
filter(df_sono, sono_total >=16)

#filtro com mais de uma condição
filter(df_sono, sono_total>= 16, peso >=80)

#filter com o operador in
filter(df_sono, cidade %in% c("Recife", "Curitiba"))


#utilizando o arrange()
# ---> %>% operador de concatenação de funções.

df_sono %>% arrange(cidade) %>% head

#utilizando o operador de concatenação de funções

df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head

df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >=16)

#aplicando a orde decrescente
df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >=16)

#utilizando o mutate()
df_sono %>%
  mutate(novo_indice = sono_total / peso) %>%
  head


df_sono %>%
  mutate(novo_indice = sono_total / peso,
         peso_libras = peso / 0.45359237) %>%
  head


df_sono_copia <- df_sono

#desafio rapido
#crie um novo dataframe e atribua novas colunas
df_sono_copia <- df_sono %>%
  mutate(novo_indice = sono_total / peso,
         peso_libras = peso / 0.45359237)

View(df_sono_copia)


#summmarise

#soma pela media do sono.
df_sono %>%
  summarise(media_sono = mean(sono_total))


df_sono %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

#grooup_by
df_sono %>%
  group_by(cidade) %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

#função aninhada
df_sono %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice))%>%
  select(cidade, novo_indice)
  
  
  
  




