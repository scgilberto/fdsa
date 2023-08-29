#parametros de graficos

?par

#lista todos os parametros configurados para area de plotagem
par()

#exemplo e alteração de parametro
x = 2:4
plot(x, pch= "*") #altera os pontos do grafico

#criando varios graficos em uma unica area de plotagem

par(mfrow= c(2,2), col.axis = "red")
plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
legend("topright", pch = 1, col = c("blue", "red"), legend = c("Var1", "Var2"))
par(mrfrow = c(1,1))

#pacotes de acessorios para o basic plot system
install.packages('plotrix')

library('plotrix')
?plotrix

par(mfrow = c(1,1),col.axis = "red")
plot(1:6, las=3, xlab = "lty 1:6", ylab = "", main = "Mais Opções ao plot")
ablineclip(v=1, lty=1, col="Sienna1", lwd=2)
ablineclip(v=2, lty=1, col="Sienna1", lwd=2)
ablineclip(v=3, lty=1, col="Sienna1", lwd=2)
ablineclip(v=4, lty=1, col="Sienna1", lwd=2)
ablineclip(v=5, lty=1, col="Sienna1", lwd=2)
ablineclip(v=6, lty=1, col="Sienna1", lwd=2)
ablineclip(v=7, lty=1, col="Sienna1", lwd=2)

plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n") #limpa a area de plotagem

#dois plots juntos
par(mar=c(4,3,3,3), col.axis="black")

plot(cars$speed, type="s", col="red", bty="n", xlab="cars ID", ylab = "")
text(8,14, "velocidade",cex=0.85, col="red")

plot(cars$dist, type = "s", bty="n",ann = F, axes = F, col="darkblue")
axis(side=4)
text(37,18, "Distancia",cex=0.85, col="darkblue")
title(main = "Velocidade x Distancia")


