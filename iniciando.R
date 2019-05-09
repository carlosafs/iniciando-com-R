install.packages("ggplot2")
install.packages("gridExtra")
install.packages("tidyverse")

library(ggplot2)
library(gridExtra)
library(tidyverse)

mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
      labs( x = "tamanho do motor", 
            y = "Eficiência km/galão em rodovia", 
            color = "Tipo de carro", 
            title = "Analise do tamanho do motor pelo consumo")

mpg

ggplot(data = mpg) + 
  geom_violin(mapping = aes(x = class, y = hwy), color = "green") +
    labs( x = "Tipo de carro", 
      y = "Eficiência km/galão", 
      title = "Analise do tipo de carro pelo consumo")
    
# Para saber o que é 'mpg'
?mpg

grafico_na_rodovia <-ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  labs( x = "tamanho do motor", 
        y = "Eficiência km/galão em rodovia", 
        color = "Tipo de carro", 
        title = "Analise do tamanho do motor pelo consumo")

grafico_na_cidade <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cty, color = class)) +
  labs( x = "tamanho do motor", 
        y = "Eficiência km/galão na cidade", 
        color = "Tipo de carro", 
        title = "Analise do tamanho do motor pelo consumo") 

grafico_de_eficiencia <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = class)) +
  labs( x = "Eficiência km/galão em rodovia", 
        y = "Eficiência km/galão na cidade", 
        color = "Tipo de carro", 
        title = "Analise do tamanho do motor pelo consumo") 


grid.arrange(grafico_na_rodovia, grafico_na_cidade, grafico_de_eficiencia,
             ncol = 1, nrow = 3)


#divisão de eficiencia por ambiente
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = trans)) +
   facet_wrap(~ class)

#divisão de eficiencia por tipo de transmissão
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = class, shape = class)) +
  facet_wrap(~ trans)


#criando outra coluna
mpg_coluna_nova <- mpg %>%
  mutate(cambio = case_when(grepl("auto", trans) ~ "automatico",
                           grepl("manu", trans, ignore.case = TRUE) ~ "manual")) 


ggplot(data = mpg_coluna_nova) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = trans, shape = cambio)) +
  facet_wrap(~ class)

ggplot(data = mpg_coluna_nova) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = model, shape = cambio)) +
  facet_wrap(~ class)

ggplot(data = mpg_coluna_nova) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = manufacturer, shape = cambio))

#graficos divididos por marca
ggplot(data = mpg_coluna_nova) + 
  geom_point(mapping = aes(x = hwy, y = cty, color = class, shape = cambio)) +
  facet_wrap(~ manufacturer)

#graficos divididos por marca
ggplot(data = mpg_coluna_nova) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = cambio)) +
  facet_wrap(~ manufacturer)

#graficos divididos por marca
mpg_filtrado_pontiac <- mpg_coluna_nova %>% filter(manufacturer == "pontiac")

g1 <- ggplot(data = mpg_filtrado_pontiac) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = cambio))
  
g2 <- ggplot(data = mpg_filtrado_pontiac) + 
  geom_point(mapping = aes(x = displ, y = cty, color = class, shape = cambio))

grid.arrange(g1, g2,
             ncol = 1, nrow = 2)
# Ajustar os valores dos eixos x e y
