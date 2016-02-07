source("007/nth_prime2.R")


sum_of_primes_less_than <- function(N, env = new.env()) {
  ## Actually run code
  withr::with_options(c(scipen = 999), {
    sum_counter <- 0
    repeat {
      p <- get_next_prime(env)
      if (p >= N) break
      sum_counter <- sum_counter + p
    }
  })

  sum_counter
}
