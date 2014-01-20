library(whisker)
library(slidify)

read_file <- function(file) {
  con <- file(file)
  txt <- paste(readLines(con, warn = F), collapse = "\n")
  txt <- paste(txt, "\n", sep = "")
  close(con)
  return(txt)
}

write_file <- function(str, file) {
   con <- file(file)
   writeLines(str, con)
   close(con)
}

file <- "rin10minutes.template"

# Create presentations
str <- whisker.render(read_file(file), data = list(
   handout = T,
   framework = "io2012",
   hitheme = "github"
))
rmd <- gsub(".template", "-handout.Rmd", file)
write_file(str, rmd)
pagify(rmd)

