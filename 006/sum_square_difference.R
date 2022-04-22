sum_square_difference <- function(max_num) {
  full_range <- seq(1, max_num)
  ( sapply(full_range, `^`, 2) %>% sum - sum(full_range) ^ 2 ) %>% abs
}
