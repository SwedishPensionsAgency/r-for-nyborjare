library(whisker)
library(slidify)

handout <- TRUE

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

str <- whisker.render(
   read_file("part-1.template"),
   data = list(handout = handout)
)

write_file(str, "part-1.Rmd")
slidify("part-1.Rmd")
