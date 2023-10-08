setwd("C:/treinamentos/fData_Science/f_DSA/Cap06")

dir()
#instalando bibliotecas
install.packages("devtools")
install.packages("mongolite")
#install.packages("duckdb")


#carregando as bibliotecas
library(ggplot2)
library(devtools)
library(mongolite)


#ajuda do mongolite
?mongolite


#criando conexão como o mongodb
con <- mongo(collection = "airbnb",
             db = "dstreinamento",
             url = "mongodb://localhost",
             verbose = FALSE,
             options = ssl_options())

#visualizando os dados
dados <- con$find()
View(dados)

#verificando o numero de registro no bd
con$count('{}')

#busca uma amostra
amostra1 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true, "cancellation_policy": true}'
)
View(amostra1)

#sem o campo id
amostra2 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true, "cancellation_policy": true, "_id": false}'
)
View(amostra2)

#Ordenando o resultado
amostra3 <- con$find(
  query = '{"property_type": "House"}',
  fields = '{"property_type": true, "cancellation_policy": true, "_id": false}',
  sort = '{"cancellation_policy": -1}'
)
View(amostra3)

#agragando valores
amostra4 <- con$aggregate(
  '[{"$group": {"_id":"$property_type", "count": {"$sum":1},"average":{"$avg":"$number_of_reviews"}}}]',
  options = '{"allowDiskUse":true}'
)
names(amostra4)<- c("tipo_propriedade","contagem", "media_reviews")
View(amostra4)

ggplot(aes(tipo_propriedade, contagem), data = amostra4) + geom_col()


#aplicando o MapReduce - Mapeamento e Redução

#contagem do numero de reviews e considerando 

resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews),1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado)<- c("numero_reviews","contagem")
View(resultado)

#plotando
ggplot(aes(numero_reviews, contagem),data = resultado) + geom_col()

#fazendo de review por faixas
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.number_of_reviews/100)*100,1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado)<- c("numero_reviews","contagem")
View(resultado)

ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

#Contagem do numero de quartos
resultado <- con$mapreduce(
  map = "function(){emit(Math.floor(this.bedrooms), 1)}",
  reduce = "function(id, counts){return Array.sum(counts)}"
)
names(resultado)<- c("numero_quartos","contagem")
View(resultado)

ggplot(aes(numero_quartos,contagem),data = resultado) + geom_col() 

