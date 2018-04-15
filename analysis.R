library(tidyverse)

df = read.csv('Documents/kaggle/pokemon/Pokemon.csv')

# not interested in mega evolutions right now
df = df %>% 
  distinct(X., .keep_all=TRUE)

# replace empties with NAs. NA is easier to handle
df[df == ''] <- NA

# fill empty type rows with 'No Secondary'
# df[is.na(df$Type.2)] <- "No Secondary"
# df <- df %>% 
#   mutate_if(is.na(Type.2), funs(replace(., is.na(.), 'No secondary')))

# filter to keep only generation 1 pokemon
gen1 <- df %>% 
  filter(Generation == 1)

# plot frequency count of primary types in generation 1
ggplot(data = gen1, aes(Type.1)) + 
  geom_bar() +
  scale_color_brewer(type = 'div', palette = 15, direction = 1) + 
  xlab('Primary Type') + ylab('Count') + 
  ggtitle('Primary Pokemon Types in Generation 1')
  
# plot frequency count of secondary types in generation 1
ggplot(data = gen1, aes(Type.2)) + 
  geom_bar() +
  scale_color_brewer(type = 'div', palette = 15, direction = 1) + 
  xlab('Primary Type') + ylab('Count') + 
  ggtitle('Primary Pokemon Types in Generation 1')

