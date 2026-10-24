library(dplyr)
library(ggplot2)
library(broom)

data <- sleep

# Compute group means for bar plot
summary_tbl <- data |>
  group_by(group) |>
  summarise(
    mean_extra = mean(extra),
    sd_extra   = sd(extra),
    n          = n(),
    se_extra   = sd_extra / sqrt(n)
  )

# Compute prolongation (drug - placebo) per subject
sleep1 <- data |>
  group_by(ID) |>
  summarise(
    prolongation = extra[group == 2] - extra[group == 1]
  )

# Paired t-test
tt <- t.test(sleep1$prolongation, mu = 0)
tt_tidy <- tidy(tt)

p_value <- signif(tt_tidy$p.value, 3)
t_stat  <- signif(tt_tidy$statistic, 3)

# Bar plot with t-test annotation
ggplot(summary_tbl, aes(x = factor(group), y = mean_extra)) +
  geom_col(fill = "steelblue", alpha = 0.8, width = 0.6) +
  geom_errorbar(aes(ymin = mean_extra - se_extra,
                    ymax = mean_extra + se_extra),
                width = 0.2, linewidth = 0.8) +
  labs(
    title = "Extra Sleep by Drug",
    x = "Drug",
    y = "Extra Sleep (hours)"
  ) +
  annotate(
    "text",
    x = 1.5,
    y = max(summary_tbl$mean_extra) + 1,
    label = paste0("t = ", t_stat, "\n",
                   "p = ", p_value),
    size = 5,
    hjust = 0.5
  ) +
  theme_minimal(base_size = 14)
