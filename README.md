r-for-nyborjare
===============

Kursmaterial till en R-kurs för nybörjare. Skrivet i R och RMarkdown.

## Hur man genererar presentation

Installera `slidify`:

    library(devtools)
    install_github("slidify", "ramnathv")
    install_github("slidifyLibraries", "ramnathv")

Skapa `html`:

    slidify("part-1.Rmd")
