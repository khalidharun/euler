library(magrittr)

get_largest_prime_factor <- function(x) x %>% all_factors %>% tail(., 1) %>% print_counter

find_next_factor <- function(x, after=1) {
  on.exit({ message(paste("Find next factor of", x, "after", after, ":", returnValue())) })
  i <- after
  while (TRUE) {
    i <- get_next_candidate_after(i)
    if (identical(0, x %% i)) return(i)
  }
}

get_next_candidate_after <- function(k) {
  if (k == 1) return(2)
  if (k == 2) return(3)
  k + 2
}

all_factors <- function(x, after = 1) {
  orig_x <- x
  on.exit({ message(paste("All factors of", orig_x, "after", after, ":", paste(returnValue(), collapse = ", "))) })

  # Base case
  if (x == 1) return()

  fac <- find_next_factor(x, after)
  if (fac == x) return(x)

  # Recursive case
  while (0 == x %% fac) { x <- x/fac }
  c(fac, Recall(x, fac))
}

is_prime <- function(x) x %>% as.numeric %>% all_factors %>% length %>% identical(., 1L)
