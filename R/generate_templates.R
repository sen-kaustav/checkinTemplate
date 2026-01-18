#' Generate quarterly check-in templates
#'
#' @param names A character vector of names
#' @param year *Optional* A numeric value specifying the year. Defaults to current system year.
#' @param output_dir *Optional* The folder location where the files will be saved. Defaults to current working directory.
#'
#' @returns NULL. The function has not return value and it only used for its side-effects.
#'
#' @export
#' @examples
#' # No year specified. It will default to current year.
#' generate_templates(names = c("Peter", "Sam", "Lucy"))
#'
#' # Year explicity specified.
#' generate_templates(names = c("Peter", "Sam", "Lucy"), year = 2026)

generate_templates <- function(
  names,
  year = lubridate::year(Sys.Date()),
  output_dir = fs::path_wd()
) {
  quarters <- generate_quarters(year)

  purrr::walk(names, function(name) {
    member_dir <- fs::path(output_dir, name)
    fs::dir_create(member_dir)

    message(glue::glue("Creating documents for {name}..."))

    # Generate files for all the four quarters
    purrr::walk(quarters, function(quarter) {
      output_filename <- glue::glue("{name}_{quarter}.docx")
      quarto::quarto_render(
        input = system.file(
          "quarterly_check_in_template.qmd",
          package = "checkinTemplate"
        ),
        output_file = output_filename,
        execute_params = list(name = name, period = quarter),
        quiet = TRUE
      )

      fs::file_move(
        system.file(output_filename, package = "checkinTemplate"),
        member_dir
      )
    })
  })

  message(glue::glue(
    "\nCompleted! Generated {length(names) * length(quarters)} documents."
  ))

  invisible(NULL)
}
