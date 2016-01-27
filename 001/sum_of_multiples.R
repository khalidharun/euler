# Sum of multipes of 3 and 5 below N

sum_of_multiples <- function(n) {
  sum <- 0
  for (i in seq(1, n-1)) {
    if (0 == i %% 3 || 0 == i %% 5) sum <- sum + i
  }
  sum
}

sum_of_multiples(1000)
