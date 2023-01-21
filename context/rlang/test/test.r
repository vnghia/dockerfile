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
