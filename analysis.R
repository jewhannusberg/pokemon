library(tidyverse)

df = read.csv('Documents/kaggle/pokemon/Pokemon.csv')

# not interested in mega evolutions right now
df = df %>% 
  distinct(X., .keep_all=TRUE)
