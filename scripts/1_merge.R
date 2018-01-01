# skript to merge red wine and white wine data

# load packages----
library(tidyverse)

# read files----
w <- read.csv("./data/wineQualityWhites.csv")
r <- read.csv("./data/wineQualityReds.csv")

# add classes----
w <- w %>% 
  mutate(class = "w")

r <- r %>% 
  mutate(class = "r")

# combine datasets, clean column with rownumber and make class-factor----
wines <- bind_rows(w,r) %>% 
  select(-1) %>% 
  mutate(class = factor(class))

# save data
saveRDS(wines, file = "./data/wineQualityCombined.RDS")
write.csv(wines, file = "./data/wineQualityCombined.csv")
