create_new_bucket <- function(lo, size, env) {
  if (lo %% 2 == 0) stop("lo must be an odd number")

  hi <- lo + 2*(size - 1)
  paste("Creating bucket: (", lo, "...", hi, ")") %>% message
  env$bucket <- setNames(!vector("logical", size), seq(lo, hi, 2))
  env$hi <- hi
  env$lo <- lo
  env$bucket
}


mark_composites <- function(env, p) {
  hi <- env$hi
  lo <- env$lo
  from <- p * p
  if (hi < from) return(FALSE)

  # message("Marking ", paste(from, p, hi, sep = ":"))
  idx <- intersect(names(env$bucket), as.character(seq(from, hi, p)))
  env$bucket[idx] <- FALSE
  TRUE
}



get_next_prime <- function(env = prime_env) {

  p <- NULL
  while (is.null(p)) {
    p <- find_next_prime(env)
  }
  message("Found prime #", length(env$primes), ": ", p)
  p
}

find_next_prime <- function(env) {
  # on.exit({message("find_next_prime: ", returnValue())})

  if (is.null(env$cursor)) {
    p <- 2
    env$primes <- p
    create_new_bucket(3, getOption("prime.bucket_size", 2^11), env)
    env$cursor <- p + 1 # start with 3
    mark_composites(env, p)
    return(p)
  }

  if (env$cursor <= env$hi) {
    for (i in seq(env$cursor, env$hi, 2)) {
      if (isTRUE(env$bucket[[as.character(i)]])) {
        env$primes <- c(env$primes, i)
        mark_composites(env, i)
        env$cursor <- i + 2
        env$p_limit_hit <- FALSE
        return(i)
      }
    }
  }

  # use_next_bucket
  env$cursor <- env$hi + 2
  new_lo <- env$hi + 2
  size <- length(env$bucket)
  create_new_bucket(new_lo, size, env)
  for (p in env$primes) {
    if (!isTRUE(mark_composites(env, p))) {
      message('Stopped after: ', p)
      break
    }
  }

  return(NULL)
}

# prime_env <- list2env(
#   list(
#     primes = NULL,
#     bucket = create_new_bucket(2, 2^12),
#     cursor = 1
#   )
# )

find_nth_prime <- function(N, env = new.env()) {
  ## Actually run code
  withr::with_options(c(scipen = 999), {
    i <- 0
    while (i < N) {
      p <- get_next_prime(env)
      i <- i + 1
    }
  })

  tail(env$primes, 1)
}
