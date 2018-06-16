library(shiny)
library(tidyverse)
library(wesanderson)
library(ggplot2)
df = read.csv('Pokemon.csv')

# not interested in mega evolutions right now
df = df %>% 
  distinct(X., .keep_all=TRUE)

# how to build strengths and weaknesses graph?
# series of if statements? 

# unique types (assumes all types included in Type.1)
types <- unique(df$Type.1)

type_mat <- setNames(data.frame(matrix(ncol = length(types), nrow = length(types))), 
         types)
rownames(type_mat) <- types

# scoring
# neutral effect = 0
# super effective = 1
# not very effective = -1
# no effect = -100


