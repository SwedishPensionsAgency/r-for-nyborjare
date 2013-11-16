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

render_rmd <- function(file, handout) {
   res <- whisker.render(
      read_file(file),
      data = list(handout = handout)
   )
   return(res)
}

file <- "part-1.template"

# Render presentation
str <- render_rmd(file, F)
output <- gsub(".template", "-handout.html", file)
knit2html(text = str, output =  output)

# Render handout
str <- render_rmd(file, T)
output <- gsub(".template", ".Rmd", file)
write_file(str, output)
slidify(output)
