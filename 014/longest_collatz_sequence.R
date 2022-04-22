get_next_collatz_sequence <- function(n) {
  if (0 == n %% 2) n/2
  else 3*n + 1
}

get_collatz_sequence_length <- function(n) {
  if (n == 1) return(1)
  n <- get_next_collatz_sequence(n)
  fn <- match.fun("get_collatz_sequence_length")
  1 + fn(n)
}

get_collatz_sequence_length <- memoise::memoise(get_collatz_sequence_length)

get_collatz_seq_length <- function(n) {
  counter <- 1
  repeat {
    if (n == 1) break
    n = get_next_collatz_sequence(n)
    counter <- counter + 1
  }
  counter
}

find_longest_collatz_sequence <- function(limit = 20, length_fn = get_collatz_seq_length) {
  max_count <- 0
  max_count_i <- NULL

  i <- 2
  repeat {
    n <- i
    counter <- length_fn(n)
    if (counter > max_count) {
      max_count <- counter
      max_count_i <- i
      message("next highest found: ", paste(max_count_i, max_count, sep = " || "))
    }

    i <- i + 1
    if (i >= limit) break
  }
  max_count_i
}

# fns <- list(get_collatz_seq_length, get_collatz_sequence_length)

# results <- lapply(fns, function(fn) {
#   timing <- system.time({
#     answer <<- find_largest_collatz_sequence(1e5, fn)
#   })

#   list(timing = timing, answer = answer)
# })

# results

find_longest_collatz_sequence(1e6)
