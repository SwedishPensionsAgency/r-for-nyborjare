Grundkurs i R
========================================================
transition: linear
css: css/slides.css

Love Hansson och Thomas Reinholdsson, Pensionsmyndigheten

18 november, 2014


Lärandemål
========================================================
type: section

- Sammanställa deskriptiv statistik om data med enklare funktioner
- Använda ggplot och grafiska funktioner för deskription och exploration av data
- Använda och förstå ett flertal datastrukturer
- Installera och använda paket
- Hämta data från olika källor (Excel, MiDAS, Coldbir, Pedal)
- Lagra data i olika format
- Självständigt inhämta ny kunskap och hitta svar på frågor om R (vara en del av R:s community)


Kurslitteratur
=======================================================

- [Advanced R programming](http://adv-r.had.co.nz) av Hadley Wickham



Datastrukturer
========================================================
type: section

Det finns flera olika datatyper som används inom R, de vanligaste listas nedan:

- Vektorer
  - Atomic vectors (`vector`)
  - Listor (`list`)
  - Faktorer (`factor`)
- Matriser (`matrix`, `array`)
- Datatabeller
  - Data frame (`data.frame`)
  - Data table (`data.table`)

Atomic vectors
========================================================

De vanligaste typerna av vektorer är:


```r
logical <- c(T, FALSE, TRUE, FALSE)
numeric <- c(1, 2.5, 4.5)
integer <- c(1L, 6L, 10L)
character <- c("these are", "some strings")
```


Man kan lägga samman vektorer och de "plattas" då ut:


```r
c(1, 2, 3, 4)
```

```
[1] 1 2 3 4
```

```r
c(1, c(2, c(3, 4)))
```

```
[1] 1 2 3 4
```


========================================================

För att testa eller se vilken datatyp en variabel är:


```r
typeof(integer)
```

```
[1] "integer"
```

```r
is.integer(integer)
```

```
[1] TRUE
```

```r
is.double(integer)
```

```
[1] FALSE
```


Man kan även kontrollera för om det är en vektor:


```r
is.vector(integer)
```

```
[1] TRUE
```


========================================================

Vektorer kan enbart innehålla en datatyp. När man kombinerar flera olika datatyper, så får man tänka på att de konverteras till en och samma typ.


```r
c("a", 1)
```

```
[1] "a" "1"
```

```r
c("a", T)
```

```
[1] "a"    "TRUE"
```

```r
c(1, T, F)
```

```
[1] 1 1 0
```


När logiska vektorer (`TRUE`/`FALSE`) konverteras så ersätts de med `1` och `0`. Därav kan man t.ex. använda sig av `sum()`.


Listor
========================================================

Listor kan innehålla olika typer av vektorer:


```r
x <- list(1:3, "a", c(T, F, T), c(2.3, 5.9))
```


Dessutom så kan de innehålla ytterligare listor, vilket medför att de ibland kallas ibland för __recursive vectors__.


```r
x <- list(list(1,2), list("a","b","c"), 5:9)
str(x)
```

```
List of 3
 $ :List of 2
  ..$ : num 1
  ..$ : num 2
 $ :List of 3
  ..$ : chr "a"
  ..$ : chr "b"
  ..$ : chr "c"
 $ : int [1:5] 5 6 7 8 9
```



Namn
========================================================

Alla objekt kan ha attribut kopplade till sig. Ett vanligt sådant är till exempel list- eller vektornamn.

### Vektorer 


```r
x <- c(a = 1, b = 2, c = 3)
x <- c("a" = 1, "b" = 2, "c" = 3)
x
```

```
a b c 
1 2 3 
```


Man kan även ändra eller lägga till namn i efterhand:


```r
names(x) <- c("x", "y", "z")
```



### Listor


```r
x <- list(a = 1, b = 2, list(c = 3, d = 4))
```



Faktorer
========================================================

Faktorer inkluderar en slags uppslagstabell för kodvärden:


```r
x <- factor(c("a", "b", "b", "a"))
x
```

```
[1] a b b a
Levels: a b
```

```r
levels(x)
```

```
[1] "a" "b"
```


Observera att man **inte** kan kombinera två faktorvariabler:


```r
c(factor("a"), factor("b"))
```

```
[1] 1 1
```


Därför bör man vara extra varsam när man använder sig av faktorvariabler.


Läs mer om datastrukturer
========================================================


Subsetting
========================================================
type: section

När vi har data vill vi kunna arbeta med delar av data. Detta kallas __subsetting__.

Vår metod för att hämta ut delar av data beror på vilken __datatyp__ vi använder oss av.

R erbjuder __flera metoder__ för att hämta ut data för varje datatyp.

Enkla vektorer
========================================================

Data:

```r
x <- c(aa=2.1, bb=4.2, cc=3.3, dd=5.4)
```


Metoder för dataextrahering:

```r
x[c(1,2)] # Välj ett eller flera element
x[order(x)] # Välj alla element, sorterade
x[['aa']] # Välj ett, namngivet eller numrerat, element
```


Listor
========================================================

De metoder som fungerar för listor fungerar _oftast_ även för vektorer.

Data:

```r
ll <- list(2.1, 4.2, 3.3, 5.4)
```


Metoder för dataextrahering:

```r
ll[c(1,2)]
ll[[1]]
```


data.frame()
========================================================


Data:

```r
DF <- data.frame(id=c(1:3),
value=c("Love", "Thomas", "Ole"))
```



Urval kan göras kolumnvis, radvis, eller enligt vissa kriterier. Observera kommatecknet i []-anropet!

```r
DF[c(1,2),]
DF[,c("value")]
DF[DF$value=="Ole",]
```


data.table()
========================================================

data.table fungerar ungefär som data.frame, men skiljer sig i vissa detaljer.


```r
DT <- data.table(id=c(1:3),
value=c("Cédric", "Elin", "Ingemar"))
```






En grundläggande "vokabulär"
========================================================
type: section

20-30 funktioner (?) ur Hadleys "Vocabulary"-avsnitt


Funktioner
========================================================
type: section


Pakethantering
========================================================
type: section


Grafik och dataanalys
========================================================
type: section

- ggplot2


Externa datakällor
========================================================
type: section



Best practices för programdesign
========================================================
type: section


Att lära sig mer om R
========================================================
type: section

- R:s community
- Stack Overflow
- GitHub


Avslutning och utblick
========================================================
type: section


Kurslitteratur
========================================================
type: section





