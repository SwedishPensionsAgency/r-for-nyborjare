r-for-nyborjare
===============

Kursmaterial till en R-kurs för nybörjare. Skrivet i R och RMarkdown.

## Hur man genererar presentation

Installera `slidify` och `whisker`:

    library(devtools)
    install_github("slidify", "ramnathv")
    install_github("slidifyLibraries", "ramnathv")
    install.packages("whisker")

För att skapa `html`-presentationen, kör koden i `render.r`.
