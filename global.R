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
types_mat[1:18,3] <- c(1, 2, 0.5, 2, 1, 2, 0.5, 0.5, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2)
# fire defending
types_mat[19:36,3] <- c(0.5, 0.5, 2, 0.5, 1, 1, 1, 2, 0.5, 1, 1, 2, 1, 0.5, 1, 1, 0.5, 1)
# water defending
types_mat[37:54,3] <- c(2, 0.5, 0.5, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 0.5, 1)
# bug defending
types_mat[55:72,3] <- c(0.5, 2, 1, 1, 1, 1, 1, 0.5, 1, 0.5, 1, 2, 1, 1, 1, 1, 1, 2)
# normal defending
types_mat[73:90,3] <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 1, 1, 1, 1)
# poison defending
types_mat[91:108,3] <- c(0.5, 1, 1, 0.5, 1, 0.5, 1, 2, 0.5, 0.5, 2, 1, 1, 1, 1, 1, 1, 1)
# electric defending
types_mat[109:126,3] <- c(1, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5)
# ground defending
types_mat[127:144,3] <- c(2, 1, 2, 1, 1, 0.5, 0, 1, 1, 1, 1, 0.5, 1, 2, 1, 1, 1, 1)
# fairy defending
types_mat[145:162,3] <- c(1, 1, 1, 0.5, 1, 2, 1, 1, 1, 0.5, 1, 1, 1, 1, 0, 0.5, 2, 1)
# fighting defending
types_mat[163:180,3] <- c(1, 1, 1, 0.5, 1, 1, 1, 1, 2, 1, 2, 0.5, 1, 1, 1, 0.5, 1, 2)
# psychic defending
types_mat[181:198,3] <- c(1, 1, 1, 2, 1, 1, 1, 1, 1, 0.5, 0.5, 1, 2, 1, 1, 2, 1, 1)
# rock defending
types_mat[199:216,3] <- c(2, 0.5, 2, 1, 0.5, 0.5, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 2, 0.5)
# ghost defending
types_mat[217:234,3] <- c(1, 1, 1, 0.5, 0, 0.5, 1, 1, 1, 0, 1, 1, 2, 1, 1, 2, 1, 1)
# ice defending
types_mat[235:252,3] <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0.5, 1, 1, 2, 1)
# dragon defending
types_mat[253:270,3] <- c(0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 1, 2, 1, 1, 1, 1, 2, 2, 1, 1, 1)
# dark defending
types_mat[271:288,3] <- c(1, 1, 1, 2, 1, 1, 1, 1, 2, 2, 0, 1, 0.5, 1, 1, 0.5, 1, 1)
# steel defending
types_mat[289:306,3] <- c(0.5, 2, 1, 0.5, 0.5, 0, 1, 2, 0.5, 2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5)
# flying defending
types_mat[307:324,3] <- c(0.5, 1, 1, 0.5, 1, 1, 2, 0, 1, 0.5, 1, 2, 1, 2, 1, 1, 1, 1)
