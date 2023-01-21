## ---- init ----
library(ggplot2)
library(scico)

library(kableExtra)

library(dplyr)
library(reshape2)
library(tidyverse)

library(reticulate)

knitr::opts_chunk$set(dev = "tikz", echo = F, cache = T)
options(tikzDefaultEngine = "luatex")

np <- import("numpy")

## ---- kable ----
mtcars %>%
  kbl(
    booktabs = T, escape = F,
  ) %>%
  kable_styling(latex_options = c("hold_position", "scale_down"))
