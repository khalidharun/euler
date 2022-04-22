#! /usr/bin/env Rscript

source("lib/utils.R")
library(magrittr)

print.fraction <- function(f) print(paste(f$num, f$denom, sep = "/"))

generate_candidates <- function(start = 11, end = 99) {
  lapply(seq(start+1, end), function(denom) {
    lapply(seq(start, denom-1), function(num) {
      `class<-`(list(num = num, denom = denom), "fraction")
    })
  }) %>% Reduce(append, .)
}

is_curious_fraction <- function(fraction) {
  f <- sapply(fraction, function(x) strsplit(split = "", as.character(x)))

  for (i in seq(1,2)) {
    if (f$num[i] %in% f$denom) {
      digit <- f$num[i]
      if (identical("0", digit)) return(FALSE)
      num = as.numeric(f$num[3-i])
      denom = as.numeric(f$denom[-which(f$denom == digit)[1]])
      if (fraction$num/fraction$denom == num/denom) {
        print(fraction)
        return(TRUE)
      }
    }
  }

  FALSE
}

get_prime_factors <- function(num) {
  if (num == 1) return(list(`1` = 1))
  factors <- list()
  for (i in seq(2, num)) {
    k <- as.character(i)
    while (num %% i == 0) {
      factors[[k]] <- 1 + factors[[k]] %||% 0
      num <- num/i
    }
    if (num == 1) break
  }
  factors
}

compute_LCD <- function(fractions) {
  factor_sum <- function(x, y) {
    all_names <- union(names(x), names(y))
    `names<-`(lapply(all_names, function(k) sum(x[[k]] %||% 0, y[[k]] %||% 0)), all_names) }

  # factor_common <- function(x,y) {
  #   all_names <- union(names(x), names(y))
  #   `names<-`(lapply(all_names, function(k) max(x[[k]], y[[k]])), all_names) }

  denoms_factors <- lapply(fractions, `[[`, "denom") %>%  lapply(., get_prime_factors) %>% Reduce(factor_sum, .)
  nums_factors <- lapply(fractions, `[[`, "num") %>%  lapply(., get_prime_factors) %>% Reduce(factor_sum, .)
  factors <- `names<-`(lapply(names(denoms_factors), function(k) denoms_factors[[k]] - nums_factors[[k]] %||% 0), names(denoms_factors))

  for (x in list(denoms_factors, nums_factors, factors)) dput(x)

  Reduce(`*`, lapply(seq_along(factors), function(k) as.numeric(names(factors[k])) ** factors[[k]]))
}

generate_candidates(11, 99) %>% Filter(is_curious_fraction, .) %>% compute_LCD
