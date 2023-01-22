rmarkdown::render("test.rmd")
output_dir <- "output"
dir.create(output_dir, showWarnings = FALSE)
file.copy("test.pdf", output_dir)
