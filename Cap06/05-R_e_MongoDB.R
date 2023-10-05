setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap06")


#intalação de pacotes
install.packages("devtools")
install.packages("mongolite")

#pacotes
library(ggplot2)
library(devtools)
library(mongolite)

?mongolite
con <- mongo(collection = "airbnb",
             db = "dstreinamento",
             url = "mongodb://localhost",
             verbose = FALSE,
             options = ssl_options())

print(con)

dados <- con$find()
View(dados)

#contando os registros no mongo
con$count('{}')

#buscando uma amostra de dados com propriedade do tipo house

amostra1 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true,"cancellation_policy": true}'
)
View(amostra1)

#retirando o campo ID
amostra2 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true,"cancellation_policy": true, "_id": false}'
)
View(amostra2)

#Ordenando os valores
amostra3 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true,"cancellation_policy": true, "_id": false}',
  sort = '{"cancellation_policy":-1}'
)
View(amostra3)

#agregando valores
amostra4 <- con$aggregate(
  '[{"$group":{"_id": "property_type", "Count":{"$sum":1}, "average": {"$avg":"$number_of_reviews"}}}]',
  options = '{"allowDiskUse": true}'
)
View(amostra4)
