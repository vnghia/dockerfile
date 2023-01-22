# ggplot2
install.packages(c("ggplot2", "hrbrthemes", "scico"))

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
tlmgr_install(c("biber", "biblatex"))

# tikz
tlmgr_install(c("pgf", "preview", "xcolor"))
parse_install(files = c("grfext.sty", "luatex85.sty"))
