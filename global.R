library(shiny)
library(tidyverse)
library(wesanderson)
library(ggplot2)
df = read.csv('Pokemon.csv')

# not interested in mega evolutions right now
df = df %>% 
  distinct(X., .keep_all=TRUE)
