#' Summarise data by group
#'
#' @param data A data frame.
#' @param value_col Name of the numeric column.
#' @param group_col Name of the grouping column.
#' @returns A data frame with group, mean, sd, n, and se.
summarise_data <- function(data, value_col = "extra", group_col = "group") {

  selected_data <- data.frame(
    group = data[[group_col]],
    value = data[[value_col]]
  )

  selected_data |>
    dplyr::summarise(
      mean = mean(value),
      sd = stats::sd(value),
      n = dplyr::n(),
      se = sd / sqrt(n),
      .by = "group"
    )
}