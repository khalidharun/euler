find_special_pythogorean_triplet <- function(N) {
  for (a in seq(1, N-3)) {
    for (b in seq(a+1, N-2)) {
      c <- N - a - b
      if (a^2 + b^2 == c^2) {
        message("special triplet found: ", paste(a, b, c, sep = ", "))
        return(a*b*c)
      }
    }
  }
  return(NULL)
}

find_special_pythogorean_triplet(1000)
