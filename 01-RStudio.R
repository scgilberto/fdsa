#criando plot
plot(1:30)

print('Instalação de pacotes')


#instalando e carregando pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages("dplyr")
install.packages("devtools")
install.packages("sos")

library(sos)
findFn("Fread")

#mostra no console tudo relacionado a documentação 
help.search('randomForest')
help.search('matplot')

#outra forma de buscar a documentação
??randomForest

#abri o browser e tras toda documentação da função
RSiteSearch('matplot')

#mostra um exemplo de como utilizar a função que está sendo pesquisada

example('matplot')

#para finalizar a seção
q()
