setwd("C:/Cursos/Cuso_DSA/Modulo4")
getwd()

#constuindo barplot
?barplot


#criando a massa de dados
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados

#nomeando as colunas e linhas
colnames(dados)<- c("0","1-150", "151-300",">300")
rownames(dados)<- c("Jovem", "Adulto","Idoso")
dados

#barplot simples
barplot(dados, beside = T)

#barplot customizado
barplot(dados, col= c("tomato1","tan3", "seagreen3" ),beside = T)
legend()

#consulte o help para o legend
legend("topright", pch= 1, col= c("steelblue1","tan3", "seagreen3"), legend = c("Jovem", "Adulto","Idoso"))

#customizando o barplot
barplot(dados, col= c("steelblue1","tan3", "seagreen3" ))

#para verificar as cores
colors()

#fazendo a transposição da matriz
t(dados)
barplot(t(dados), col= c("steelblue1","tan3", "seagreen3" ), beside = T)
legend("topright", pch= 1, col= c("steelblue1","tan3", "seagreen3"), legend = c("0","1-150", "151-300",">300"))
