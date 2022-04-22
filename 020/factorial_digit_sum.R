options(scipen = 999)
factorial(100) %>% as.character %>% strsplit(., "") %>% `[[`(., 1) %>% as.numeric

fact <- function(x) {
  if (x == 1) return(1)
  x * Recall(x-1)
}

fact(100) %>% as.character %>% strsplit(., "") %>% `[[`(., 1) %>% as.numeric
