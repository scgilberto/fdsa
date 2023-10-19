setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")

#instalando o pacote de linhas aereas
install.packages("hflights")

#carregando a lib
library(hflights)
library(dplyr)
?hflights

?tbl_df

#criand o objeto flights
flights <- tbl_df(hflights)
head(flights)
str(hflights)
View(flights)

#chamada do dataframe
data.frame(head(hflights))

#filtrando os dados com slice
flights[flights$Month == 1 &  flights$DayofMonth == 1, ]

#utilizando o Filter
filter(flights, Month == 1, DayofMonth == 1 )

#utilizando o | (pipe)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")

#utilizando o operador in
filter(flights, UniqueCarrier %in% c("AA", "UA"))

#fazendo o select com range de colunas e procura de palavra chave

select(flights, Year:DayofMonth, contains("TAXY"), contains("Delay"))


#organizando os dados com concatenação de função

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance / AirTime * 60)

head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = T)))

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = T)















