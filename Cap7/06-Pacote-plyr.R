setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap07")

#instalando packs
install.packages("gapminder")



#carregando as libs

library(plyr)
library(gapminder)

#split-Apply-Combine

df<-ddply(gapminder, ~ continent,
          summarize,
          max_le = max(lifeExp))

df

str(df)
head(df)
View(df)
levels(df$continent0)


#split-Apply-Combine
ddply(gapminder, ~ continent,
      summarize,
      n_unique_countries = length(unique(country)))


#totalizando os valoresx
ddply(gapminder, ~ continent,
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))


#trabalhando o subset de dados

library(ggplot2)
data(mpg)
str(data)

data<- mpg[, c(1,7:9)]
View(data)

#Sumarizando 
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))


#varias funções
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwk = max(hwy))


#somando os dados pelas combinações de variaveis
ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))





