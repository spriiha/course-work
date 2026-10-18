library(tidyverse)
# Simulate bacterial growth under control vs antibiotic
set.seed(42)
growth <- tibble(
  treatment = rep(c("Control", "Antibiotic"), each = 15),
  OD600 = c(rnorm(15, mean = 0.8, sd = 0.05),
            rnorm(15, mean = 0.7, sd = 0.05))
)
growth |> head()

# Boxplot showing mean growth (OD600) by treatment group.
ggplot(growth, aes(x = treatment, y = OD600)) +
geom_boxplot() +
labs(
  x = "treatment",
  y = "OD600",
)

# Student's two-sample t-test (equal variances)- to check whether the mean growth differs between treatments.
t.test(OD600 ~ treatment, data = growth, var.equal = TRUE) 
# Welch's two-sample t-test (unequal variances)
t.test(OD600 ~ treatment, data = growth)

t.test(OD600 ~ treatment, data = growth, alternative = "less")
