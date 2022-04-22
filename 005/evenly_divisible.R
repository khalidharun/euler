source("003/largest_prime_factor.R")
source("lib/utils.R")

find_smallest_evenly_divisible <- function(factors) {

  decompose_factors <- function(x) {
    fac <- 1
    factors <- list()
    while (x > 1) {
      fac <- find_next_factor(x, after=fac)
      while(x %% fac == 0) {
        x <- x / fac
        factors[fac] <- 1 + factors[fac][[1]] %||% 0
      }
    }
    factors
  }

  max_counters <- function(x, y) {
    for (k in seq_along(y)) x[k] <- max(y[k][[1]] %||% 0 , x[k][[1]] %||% 0)
    x
  }

  get_product_of_factors <- function(x) {
    vapply(seq_along(x), function(i) i ** x[i][[1]] %||% 0, numeric(1)) %>% prod
  }

  lapply(factors, decompose_factors) %>% Reduce(max_counters, ., list()) %>% get_product_of_factors
}
