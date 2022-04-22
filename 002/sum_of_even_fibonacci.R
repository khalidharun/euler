
last_two <- c(3,5)
next_even_fib <- function() {
  print(last_two)
  fib1 <- sum(last_two)
  fib2 <- sum(last_two[2], fib1)
  fib3 <- sum(fib1, fib2)
  last_two <<- c(fib2, fib3)
  fib1
}

total <- 2
count <- 1
while ((fib <- next_even_fib()) < 4e6) {
  message(paste(count, fib, total))
  total <- total + fib
  count <- count + 1
}

total

