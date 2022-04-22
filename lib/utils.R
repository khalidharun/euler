`%||%` <- function(x, y) if (is.null(x)) y else x
`%|||%` <- function(x, y) if (length(x) == 0) y else x

dbo <- debugonce
