#' Generate character vector of quarters
#'
#' @param year A numeric value for the year
#'
#' @returns A character vector
#'
#' @export
#' @examples
#' generate_quarters(2026)
generate_quarters <- function(year) {
  quarters <- c("Q1", "Q2", "Q3", "Q4")
  year_suffix <- substr(year, 3, 4)
  paste0(quarters, year_suffix)
}
