#' Load the built-in sleep data
#'
#' Get the data used in our sleep analysis.
#'
#' @returns A data frame with columns extra (extra sleep in hours),
#'   group (drug group), and ID (participant).
#' @seealso [Official sleep dataset documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/sleep.html)
load_sleep_data <- function() {
  datasets::sleep
}