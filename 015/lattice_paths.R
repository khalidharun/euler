path_length <- function(i,j) {
  on.exit({
    message("l(", i, ", ", j, ") = ", returnValue())
  })
  if (i*j == 0) return(1)

  x <- min(i,j)
  y <- max(i,j)

  fn <- match.fun("path_length")
  fn(x-1, y) + fn(x, y-1)
}

path_length <- memoise::memoise(path_length)

system.time(path_length(5,5))

