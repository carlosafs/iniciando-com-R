install.packages("ggplot2")

library(ggplot2)

mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
      labs( x = "tamanho do motor", 
            y = "Eficiência km/galão", 
            color = "Tipo de carro", 
            title = "Analise do tamanho do motor pelo consumo")
