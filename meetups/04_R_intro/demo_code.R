## Slide 5 -------------------------------------------------------
# Installare i package (da CRAN)
install.packages("dplyr", dependencies=TRUE)
install.packages("ggplot2", dependencies=TRUE)
install.packages("rmarkdown", dependencies=TRUE)
install.packages("shiny", dependencies=TRUE)

# Installare i package (da github): DEMO
install_github("cloudyr/ghit")


# Caricare i package
library(dplyr)
library(ggplot2)
library(shiny)

## Slide 6 -------------------------------------------------------
# Funzionalità base
2 +
  3
log(12)

?log

# Vettori
integers = c(1L,2L,3L,4L,5L,6L,7L,8L,9L,10L)
integers = 1L:10L 
integers
booleans <- as.logical(rbinom(10, size=1, 0.5))
booleans
rnorm(10) -> doubles
doubles
characters <- c("primo","secondo", sapply(1:8,
                                          function(x){
                                            paste(letters[runif(n = x, min = 1, max = 27)],
                                                  collapse = "")
                                            })
                )
characters

ls()

# packrat : gestione package negli ambienti

# Matrici
mtx <- matrix(1:20, nrow = 4)
mtx
arr <- array(1:24,dim = c(2,3,4))
arr

# Calcoli
3*integers
sin(doubles)
log(mtx)
integers*doubles
arr^2
mtx %*% t(mtx)  # Calcolo matriciale

# Subsetting
integers <- -1:-10
integers
integers[2:5]
integers[2:5] <- NA
integers 
integers <- 1:10
characters[c(9,10)]
integers[-3]
integers[booleans]
integers[doubles>0]

## Slide 7 -------------------------------------------------------
# I data frame
ds <- data.frame(integers = integers,
                 booleans = booleans,
                 doubles = doubles,
                 characters = characters)
ds
# Più di recente, con "tidyverse":
library(dplyr)
tbl <- tibble(integers=integers,
              booleans = booleans,
              doubles = doubles,
              characters = characters)
tbl

# Identificare colonne/righe:
ds$integers
tbl$booleans
tbl[["booleans"]]
tbl[[2]]
tbl[,2]
ds[,2] 
tbl[tbl$integers %% 2 == 0, c("doubles","booleans")]

# dplyr!!
tbl %>% 
  filter(integers %%2 == 0) %>% 
  select(doubles,
         booleans)

tbl %>% 
  group_by(booleans) %>% 
  mutate(medie = mean(doubles),
    scarti = doubles - medie) %>% 
  summarise(dev_std = sd(scarti^2))

# liste
lst <- list(data_frame = ds,
            sottolista = list(integers, 1:10))
lst

## Slide 8 -------------------------------------------------------
# Un po' di modellazione
# librerie
library(pdataita)
library(pROC)
library(ggplot2)

# dati
data("titanic")

# train e test set
set.seed(10)
trns <- runif(nrow(titanic))>1/3
titan_tr <- titanic[trns,]
titan_ts <- titanic[!trns,]

# modello logistico
mod <- glm(Status ~ Class + Gender + Age + Gender:Age + Class:Age + Gender:Class, data=titan_tr,
           family = binomial())
# riepilogo
summary(mod)
mod <- update(mod, .~. -Class:Age)
summary(mod)
mod <- update(mod, .~. -Gender:Age)
summary(mod)
# grafico diagnostico (grafica base)
op <- par(mfrow=c(2,2))
plot(mod)
par(op)
dev.off()

# curva roc sui dati di test (ggplot, ma poco visibile)
preds <- predict(mod, newdata = titan_ts, type = "response")
rc <- roc(titan_ts$Status, predictor = preds)
ggroc(rc, colour="red")

# Confusion matrix
library(caret)
confusionMatrix(as.factor(ifelse(preds<=0.3,"Died","Survived")), reference = titan_ts$Status)


## Slide 9 -------------------------------------------------------

# package
library(ggridges)
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(plotly)

set.seed(100)
# Grafica base
plot(titanic$Gender, titanic$Age)
dati <- data.frame(x=rnorm(100), y=rnorm(100))
plot(dati$x, dati$y, main = "Titolo", xlab="x", ylab="y")

# Grafico con ggplot2
ggp <- ggplot(dati, aes(x=x,y=y)) +
  geom_point(aes(fill = abs(x+y), colour = abs(x+y), size=abs(x+y)))
print(ggp)

# Un po' più elaborato
ggp <- ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = `Month`, fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE in 2016') +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )
print(ggp)

# Grafica con plotly (in questo caso dplyr + ggplot che sfrutta plotly)
library(gapminder)

p <- gapminder %>%
  filter(year==1977) %>%
  ggplot( aes(gdpPercap, lifeExp, size = pop, color=continent)) +
  geom_point() +
  theme_bw()
ggplotly(p)


# Grafica 3D
library(rgl)
# Prepara i dati aggiungendo una nuova colonna coi colori
dati <- iris
mycolors <- c('royalblue1', 'darkcyan', 'oldlace')
dati$color <- mycolors[ as.numeric(dati$Species) ]
# Traccia il grafico
par(mar=c(0,0,0,0))
plot3d( 
  x=dati$`Sepal.Length`, y=dati$`Sepal.Width`, z=dati$`Petal.Length`, 
  col = dati$color, 
  type = 's', 
  radius = .1,
  xlab="Sepal Length", ylab="Sepal Width", zlab="Petal Length")


# Grafici animati
library(gganimate)
library(babynames)
# Prende solo 3 nomi
don <- babynames %>% 
  filter(name %in% c("Ashley", "Patricia", "Helen")) %>%
  filter(sex=="F")
# Genera il grafico (dplyr + ggplot + gganimate)
ggp <- don %>%
  ggplot( aes(x=year, y=n, group=name, color=name)) +
  geom_line() +
  geom_point() +
  scale_color_viridis(discrete = TRUE) +
  ggtitle("Popolarità di nomi americani negli ultimi 30 anni") +
  theme_ipsum() +
  ylab("Numero di neonati") +
  transition_reveal(year)
# Save at gif:
anim_save(paste0(getwd(),"/pippo/animazione.gif"))


## Slide 10 -------------------------------------------------------
fattoriale <- function(x){
  ret_val <- 1
  if(x>0){
    for(i in 1:x){
      ret_val <- ret_val * i
    }
  }
  return(ret_val)
}
fattoriale(5)

# Diverse versioni più compatte
fattoriale2 <- function(x){
  ret_val <- 1
  if(x>1){
    ret_val <- exp(sum(log(2:x)))
  }
  return(ret_val)
}
fattoriale2(x=5)

fattoriale2 <- function(x){
  return(if(x>1){exp(sum(log(2:x)))}else{1})
}
fattoriale2(x=5)

fattoriale2 <- function(x){
  if(x>1){exp(sum(log(2:x)))}else{1}
}
fattoriale2(x=5)