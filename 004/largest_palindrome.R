is_palindrome <- function(x) {
  str_x <- strsplit(split = "", as.character(x))[[1]]
  identical(str_x, rev(str_x))
}

find_largest_palindrome <- function(max_factor) {
  cands <- NULL
  for (i in seq(max_factor, 2)) {
    for (j in seq(i, 2)) {
      prod <- i * j
      if (isTRUE(is_palindrome(prod))) {
        paste(i, j, prod) %>% message
        cands <- c(prod, cands)
        break
      }
    }
  }
  max(cands)
}

