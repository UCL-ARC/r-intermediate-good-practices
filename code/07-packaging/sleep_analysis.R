# Sleep analysis
#
# Load the built-in sleep dataset, calculate and plot summary statistics
#
# Uses functions from the sleep package.

library(sleep)

data <- load_sleep_data()
summary_data <- summarise_data(data)

print(summary_data)

plot_summary(
  summary_data,
  fill = "mediumpurple",
  title = "Extra Sleep by Drug"
)