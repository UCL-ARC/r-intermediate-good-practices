library(obscurepackage) # stellaprins/obscurepackage can be installed using the remotes package
library(ggplot2)

data <- sleep
none_transformed_data <- none_transform(data$extra)

p <- ggplot(data, aes(x = group, y = none_transformed_data)) +
  geom_boxplot() +
  labs(
    title = "Extra Sleep by Drug Group",
    x = "Drug Group",
    y = "Extra sleep (hours)"
  )

print(p)
