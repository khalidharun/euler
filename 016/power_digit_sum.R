2^1000 %>% as.character %>% strsplit(., "") %>% `[[`(., 1) %>% as.numeric %>% sum
