setwd("C:/Cursos/Cuso_DSA/praticando_dia_a_dia/cap08")

#Estatistica na pratica - Analise de variancia (ANOVA)

#dados fornecidos
#Medicamento A = 4 5 4 3 2 4 3 4 4
#Medicamento B = 6 8 4 5 4 6 5 8 6
#Medicamento C = 6 7 6 6 7 5 6 5 5

nota_voluntario <- c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)
nota_voluntario

#lista com o total de testes dos 3 medicamento
medicamento <- c(rep("A",9),rep("B",9), rep("C",9))
medicamento


#criando o dataframe
df <- data.frame(nota_voluntario, medicamento)
View(df)


#aplicando o teste estatistico

?aov  

teste_aov <- aov(nota_voluntario ~ medicamento, data = df)
teste_aov
summary(teste_aov)


#conclusão
#Valor-p <0.05, ou seja 0.000256 < 0.05, logo rejeitamos H0
#As medidas dos grupos não são as mesmas e consequentimente os medicamentos não tem o mesmo efeito






