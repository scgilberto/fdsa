
setwd("c://Treinamentos//Formacao_DataScience//")
getwd()

#subset(), merge(), plyr::arrange()
#conhecer estas notações para construção de subconjunto de Dados

#vetores
x <- c("A","E","D","B","C")
x[]


#indices positivos - Elementos em posições especificas

#retorna somente o indice das colunas A e D
x[c(1,3)]
x[c(1,1)]
#ordena o indice
x[order(x)]


#indices negativos

#retorna todas as colunas menos A e D
x[-c(1,3)]
x[-c(1,4)]


#vetor logico para gerar subsetting
#para estes vetores quando ele possue mais elementos que o informado, o index volta e faz leitura
x[c(T, F)]
x[c(T, F, T, F)]


# A importancia do subsetting é importante pois, nem sempre é preciso de todos os dados.


#vetor de caracteres

x <- c("A","B","C","D")
y <- setNames(x, letters[1:4])
y
#chamando o vetor
y[c("d","c","a")]
y[c("a","a","a")]

#trabalhando com  matriz (bidimensional)

mat <- matrix(1:9, nrow = 3)
colnames(mat)<- c("A","B","C")
mat
#retornando a linha 1 e 2
mat[1:2,]

#retorna a coluna B e C linha 1 e 2
mat[1:2, 2:3]


#função outer permite que uma matriz se comporte como vetores individuais
?outer

vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
vals[c(4,15)]

#dataframe
df <- data.frame(x = 1:3, y = 3:1, z= letters[1:3])
df
#somente os elementos da coluna x
df$x

#aplicando o slice com filtro
df[df$x == 2, ]

#retornando a linha 3
df[c(1,3), ]

#retorna a coluna x e z
df[c("x","z")]

#mostra o tipo da coluna com uma observação de variavel
str(df["x"])


#removendo uma coluna do df
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df

#removendo a coluna z
df$z <- NULL
df

#operadores [], [[]] e $
a<- list(x = 1:3, y = 4:5)
a
a[1]
a[[1]]
#primeiro elemento do primeiro
a[[1]][[1]]

a[["x"]]a[[1]][[1]]
a[["x"]]

b <- list(a = list(b = list(c = list(d = 1))))
b
b[[c("a", "b", "c", "d")]]
b[["a"]][["b"]][["c"]][["d"]]


# x$y é equivalente a x[["y", exact = FALSE]]
var <- "cyl"
mtcars$var
View(mtcars)
mtcars[[var]]

x <- list(abc = 1)
x
x$a
x[["a"]]
x[["abc"]]


# Subsetting e atribuição
x <- 1:5
x
x[c(1, 2)] <- 2:3
x

x[-1] <- 4:1
x

# Isso é subsetting
head(mtcars)
mtcars[] <- lapply(mtcars, as.integer)
head(mtcars)


# Isso não é subsetting
mtcars <- lapply(mtcars, as.integer)
head(mtcars)


# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]
unname(lookup[x])


# Usando operadores lógicos
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y2 <- which(y1)
y2
intersect(x2, y2)
x1 & y1
union(x2, y2)
setdiff(x2, y2)


