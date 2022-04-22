library(digest)

params <- expand.grid(list(
  a = seq(2,100),
  b = seq(2,100)
))

prime_factors <- function(num) {
  if (num == 1) return(NULL)
  factors <- NULL
  for (i in seq(2,num)) {
    while(num %% i == 0) {
      factors <- c(factors, i)
      num <- num / i
    }
    if (num == 1) break
  }
  factors
}

get_prime_digest <- function(x) {
  prime_factors(x["a"]) %>% rep(., x["b"]) %>% sort %>% digest
}

distinct_powers <- params %>% apply(., 1, get_prime_digest) %>% unique %>% length
