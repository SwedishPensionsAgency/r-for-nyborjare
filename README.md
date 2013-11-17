r-for-nyborjare
===============

Kursmaterial till en R-kurs för nybörjare. Skrivet i R och RMarkdown.

## Hur man genererar presentation

Installera dev-versionerna av `slidify` och `whisker`:

    library(devtools)
    install_github("slidify", "ramnathv", ref="dev")
    install_github("slidifyLibraries", "ramnathv", ref="dev")
    install.packages("whisker")

För att skapa `html`-presentationen, kör koden i `render.r`.

`*-presentation.html` är en något förkortad version som är tänkt att användas vid presentationer.

`*-handout.html` är en utförligare version av presentatonen som är tänkt att användas som utskriftsversion.

Hela presentationen (den kortare versionen) finns även uppladdad på:
http://dl.dropboxusercontent.com/u/18122393/r-for-nyborjare/part-1-presentation.html