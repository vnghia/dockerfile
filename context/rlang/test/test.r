## ---- init ----
library(ggplot2)
library(scico)

library(kableExtra)

library(dplyr)
library(reshape2)
library(tidyverse)

library(reticulate)

knitr::opts_chunk$set(
  dev = "tikz", echo = F, message = F, warning = F, cache = T
)
options(tikzDefaultEngine = "luatex")

np <- import("numpy")

## ---- kable ----
head(mtcars) %>%
  kbl(
    booktabs = T, escape = F,
  ) %>%
  kable_styling(latex_options = c("hold_position", "scale_down"))

## ---- ggplot ----
midwest %>% ggplot(aes(x = area, y = poptotal)) +
  geom_point(aes(col = state, size = popdensity)) +
  geom_smooth(method = "loess", se = F) +
  xlim(c(0, 0.1)) +
  ylim(c(0, 500000)) +
  labs(
    subtitle = "Area Vs Population",
    y = "Population",
    x = "Area",
  )

## ---- numpy ----
np$random$seed(0L)
normal <- np$random$randn(100000L)
data.frame(normal) %>% ggplot() +
  geom_histogram(aes(x = normal))
