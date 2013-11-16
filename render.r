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

render_html <- function(file, handout) {
   str <- whisker.render(
      read_file(file),
      data = list(handout = handout)
   )
   
   if (handout) {
      rmd <- gsub(".template", "-handout.Rmd", file)
   } else {
      rmd <- gsub(".template", ".Rmd", file)
   }
   
   write_file(str, rmd)
   slidify(rmd)
}

# Create presentation
render_html("part-1.template", F)

# Create handout
render_html("part-1.template", T)
