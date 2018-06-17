# scoring
# neutral effect = 1
# super effective = 2
# not very effective = 0.5
# no effect = 0

library(shiny)
library(tidyverse)
library(wesanderson)
library(ggplot2)
df = read.csv('Pokemon.csv')


construct_types_graph <- function(df){
  df[1:18,3] <- c(1, 2, 0.5, 2, 1, 2, 0.5, 0.5, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2)
  # fire defending
  df[19:36,3] <- c(0.5, 0.5, 2, 0.5, 1, 1, 1, 2, 0.5, 1, 1, 2, 1, 0.5, 1, 1, 0.5, 1)
  # water defending
  df[37:54,3] <- c(2, 0.5, 0.5, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 0.5, 1)
  # bug defending
  df[55:72,3] <- c(0.5, 2, 1, 1, 1, 1, 1, 0.5, 1, 0.5, 1, 2, 1, 1, 1, 1, 1, 2)
  # normal defending
  df[73:90,3] <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 1, 1, 1, 1)
  # poison defending
  df[91:108,3] <- c(0.5, 1, 1, 0.5, 1, 0.5, 1, 2, 0.5, 0.5, 2, 1, 1, 1, 1, 1, 1, 1)
  # electric defending
  df[109:126,3] <- c(1, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5)
  # ground defending
  df[127:144,3] <- c(2, 1, 2, 1, 1, 0.5, 0, 1, 1, 1, 1, 0.5, 1, 2, 1, 1, 1, 1)
  # fairy defending
  df[145:162,3] <- c(1, 1, 1, 0.5, 1, 2, 1, 1, 1, 0.5, 1, 1, 1, 1, 0, 0.5, 2, 1)
  # fighting defending
  df[163:180,3] <- c(1, 1, 1, 0.5, 1, 1, 1, 1, 2, 1, 2, 0.5, 1, 1, 1, 0.5, 1, 2)
  # psychic defending
  df[181:198,3] <- c(1, 1, 1, 2, 1, 1, 1, 1, 1, 0.5, 0.5, 1, 2, 1, 1, 2, 1, 1)
  # rock defending
  df[199:216,3] <- c(2, 0.5, 2, 1, 0.5, 0.5, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 0.5)
  # ghost defending
  df[217:234,3] <- c(1, 1, 1, 0.5, 0, 0.5, 1, 1, 1, 0, 1, 1, 2, 1, 1, 2, 1, 1)
  # ice defending
  df[235:252,3] <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0.5, 1, 1, 2, 1)
  # dragon defending
  df[253:270,3] <- c(0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 1, 2, 1, 1, 1, 1, 2, 2, 1, 1, 1)
  # dark defending
  df[271:288,3] <- c(1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 0, 1, 0.5, 1, 1, 0.5, 1, 1)
  # steel defending
  df[289:306,3] <- c(0.5, 2, 1, 0.5, 0.5, 0, 1, 2, 0.5, 2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
  # flying defending
  df[307:324,3] <- c(0.5, 1, 1, 0.5, 1, 1, 2, 0, 1, 0.5, 1, 2, 1, 2, 1, 1, 1, 1)
  return(df)
}

# not interested in mega evolutions right now
df = df %>% 
  distinct(X., .keep_all=TRUE)

# how to build strengths and weaknesses graph?
# series of if statements? 

# unique types (assumes all types included in Type.1)
types <- unique(df$Type.1)
# type_mat <- setNames(data.frame(matrix(ncol = length(types), nrow = length(types))), 
#          types)
# rownames(type_mat) <- types
types_mat <- expand.grid(types, types)
types_mat <- as.data.frame(cartesianProd)

types_mat[, 3] <- NA
colnames(types_mat) <- c('attacker', 'defender', 'score')

# manually fill data
# grass defending
types_mat <- construct_types_graph(types_mat)

# turn to factors
types_mat[, 3] <- as.factor(types_mat[, 3])

