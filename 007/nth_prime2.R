find_nth_prime <- function(N) {

  create_new_bucket <- function(lo, size) {
    hi <- lo + size - 1
    paste("Creating bucket: (", lo, "...", hi, ")") %>% message
    setNames(!vector("logical", size), seq(lo, hi))
  }

  env <- list2env(
    list(
      primes = NULL,
      bucket = create_new_bucket(2, 2^12),
      cursor = 1
    )
  )

  get_next_prime <- function() {
    p <- NULL
    while (is.null(p)) {
      p <- find_next_prime()
      if (is.null(p)) {
        size <- length(env$bucket)
        lo <- names(tail(env$bucket, 1)) %>% as.numeric + 1
        use_next_bucket(lo, size)
      }
    }
    message("Found prime #", length(env$primes), ": ", p)
    p
  }

  append_prime <- function(p) {
    env$primes <- c(env$primes, p)
  }

  find_next_prime <- function() {
    # on.exit({message("find_next_prime: ", returnValue())})

    if (env$cursor == 1) {
      env$cursor <- 2
      append_prime(env$cursor)
      return(2)
    }

    mark_composites(env$cursor)
    hi <- names(tail(env$bucket, 1)) %>% as.numeric

    if (env$cursor >= hi) return(NULL)

    for (i in seq(env$cursor+1, hi, 1)) {
      if (isTRUE(env$bucket[[as.character(i)]])) {
        env$cursor <- i
        append_prime(i)
        return(i)
      }
    }
    env$cursor <- hi
    return(NULL)
  }

  use_next_bucket <- function(lo, size) {
    env$bucket <- create_new_bucket(lo, size)
    for (p in env$primes) mark_composites(p)
  }

  mark_composites <- function(p) {
    hi <- names(tail(env$bucket, 1)) %>% as.numeric
    lo <- names(head(env$bucket, 1)) %>% as.numeric
    from <- p * (lo %/% p)

    # message("Marking ", paste(from, p, hi, sep = ":"))
    idx <- intersect(names(env$bucket), as.character(seq(from, hi, p)))
    env$bucket[idx] <- FALSE
  }

  ## Actually run code
  withr::with_options(c(scipen = 999), {
    i <- 0
    while (i < N) {
      get_next_prime()
      i <- i + 1
    }
  })

  tail(env$primes, 1)
}
