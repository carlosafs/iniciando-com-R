install.packages("ggplot2")

library(ggplot2)

mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
      labs( x = "tamanho do motor", 
            y = "Eficiência km/galão", 
            color = "Tipo de carro", 
            title = "Analise do tamanho do motor pelo consumo")

mpg

ggplot(data = mpg) + 
  geom_violin(mapping = aes(x = class, y = hwy), color = "green") +
    labs( x = "Tipo de carro", 
      y = "Eficiência km/galão", 
      title = "Analise do tipo de carro pelo consumo")
    