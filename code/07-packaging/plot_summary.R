#' Plot group means and standard errors
#'
#' @param summary_data A data frame containing group, mean, and se.
#' @param fill Bar colour.
#' @param title Plot title.
#' @returns A ggplot object.
plot_summary <- function(summary_data, fill = "steelblue",
                         title = "Group means") {

  ggplot2::ggplot(
    summary_data,
    ggplot2::aes(x = factor(group), y = mean)
  ) +
    ggplot2::geom_col(fill = fill) +
    ggplot2::geom_errorbar(
      ggplot2::aes(ymin = mean - se, ymax = mean + se),
      width = 0.2
    ) +
    ggplot2::labs(title = title, x = "Group", y = "Mean") +
    ggplot2::theme_minimal()
}