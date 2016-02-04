library(magrittr)

find_the_nth_prime <- function(N) {
  i <- 0
  while(i < N) {
    p <- find_next_prime(p)
    i <- i + 1
  }
  p
}


find_next_prime <- function(i, env) {
  seive <- prepare_seive(i, env)
  limit <- sqrt(hi)

  k <- i+1
  while(k < hi) {
    if (isTRUE(seive[k])) {
      env$primes <- c(k, env$primes)
      if (k < limit) update_seive(k)
      return(k)
    } else {
      k <- k + 1
    }
  }
}

# Utils
reset_env <- function(env) {
  env$primes <- c(2,3,5,7)
  env$i <- 1
  env$size <- 2^16
}

update_seive <- function(p, hi, env) {
  ids <- seq(2*p, hi, p)
  env$seive[ids] <- FALSE
}

prepare_seive <- function(i, env = prime_env) {
  if (!exists("seive", env)) {
    lo <- 1
    hi <- 2^8
    env$seive <- setNames(!vector("logical", hi-lo+1), seq(lo, hi))
  }
  for (p in env$primes) update_seive(p, hi, env)
}


# Evaluate
prime_env <- new.env()
reset_env(prime_env)
