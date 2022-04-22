highly_divisible_triangular_numbers <- function(limit, env = new.env()) {
  repeat {
    tn <- get_next_triangular_number(env)
    divisors <- get_divisors(tn)
    if (length(divisors) > limit) break
  }
  tn
}

get_next_triangular_number <- function(env) {
  on.exit({
    message("Next triangular number: ", returnValue())
  })
  if (is.null(env$i)) {
    # Initialize and return first value
    env$i <- 1
    env$sum <- 1
    return(env$sum)
  }

  env$i <- env$i + 1
  env$sum <- env$i + env$sum
}

get_divisors <- function(num) {

  orig_num <- num
  on.exit({
    message("Divisors for ", orig_num, ": ", paste(returnValue(), collapse = ", "))
  })

  all_divisors <- c(1, num)

  if (num > 1) {
    for (i in seq(2, sqrt(num))) {
      if (identical(0, num %% i)) {
        all_divisors <- c(all_divisors, i, num / i)
      }
    }
  }

  all_divisors %>% unique %>% sort
}

#get_divisors <- memoise::memoise(get_divisors)

#highly_divisible_triangular_numbers(10)
