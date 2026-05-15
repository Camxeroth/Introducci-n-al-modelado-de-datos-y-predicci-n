# Librerías
library(dplyr)
library(ggplot2)

# Dataset
df<-women

# Renombrado de los índices
colnames(df)<-c("Altura", "Peso")

# Visualización rápida
glimpse(df)
summary(df)
sum(is.na(df))

# Identificaión de valores atípicos mediante boxplots
boxplot(df$Altura, col="Purple")
  title("Altura")

boxplot(df$Peso, col="Orange")
  title("Peso")

# Creación del modelo
modelo_rg<-lm(Peso~Altura, data=df)

# Resultados
summary(modelo_rg)

# Residuos
residuos<-modelo_rg$residuals
shapiro.test(residuos)
ggqqplot(residuos, ylab="Residuos del modelo")

# Elementos para la ecuación
coeficientes=modelo_rg$coefficients
bo=coeficientes[1]
b1=coeficientes[2]
ec<-paste("f(x)= ",coeficientes[2],"x + ", round(coeficientes[1],3))

# Gráfica con ela ecuación
ggplot(df, aes(x=Altura, y=Peso))+
  geom_point()+
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, col = "salmon")+
  theme_light()+
  labs(xlabel="Altura", ylabel="Peso")+
  annotate("text", x=68, y=125, label=ec, color="darkgreen", size=5)  
