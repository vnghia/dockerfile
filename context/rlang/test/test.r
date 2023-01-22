## ---- init ----
library(ggplot2)
library(hrbrthemes)
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

default_theme <- theme_ipsum(base_family = "") + theme(
  axis.title.x = element_text(hjust = 0.5),
  axis.title.y = element_text(hjust = 0.5), plot.margin = margin(
    t = 0.5, r = 2, b = 0.5, l = 2, "cm"
  )
)

theme_set(default_theme)

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
data.frame(normal) %>% ggplot(aes(x = normal)) +
  geom_density(alpha = .2, fill = "#FF6666")

## ---- scico ----
volcano <- data.frame(
  x = rep(seq_len(ncol(volcano)), each = nrow(volcano)),
  y = rep(seq_len(nrow(volcano)), ncol(volcano)),
  height = as.vector(volcano)
)
ggplot(volcano, aes(x = x, y = y, fill = height)) +
  geom_raster() +
  scale_fill_scico(palette = "lajolla")
