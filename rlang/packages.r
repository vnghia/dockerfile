options(install.packages.compile.from.source = "never")

# ggplot2
install.packages(c("ggplot2", "scico"), type = "binary")

# rmarkdown
install.packages(
  c("rmarkdown", "bookdown", "tikzDevice", "kableExtra"),
  type = "binary"
)

# data
install.packages(c("dplyr", "reshape2", "tidyverse"), type = "binary")

# python
install.packages(c("reticulate"), type = "binary")
