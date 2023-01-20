# ggplot2
install.packages(c("ggplot2", "scico"))

# rmarkdown
install.packages(c("bookdown", "tikzDevice", "kableExtra"))

# data
install.packages(c("dplyr", "reshape2", "tidyverse"))

# python
install.packages(c("reticulate"))

# tinytex
install.packages(c("tinytex"))
library(tinytex)
install_tinytex(force = TRUE)
tlmgr_install(c("biber"))
