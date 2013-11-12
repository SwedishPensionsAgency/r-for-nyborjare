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


Vanliga vektorer är inte "nestade": 


```r
c(1, c(2, c(3, 4)))
```

```
[1] 1 2 3 4
```

```r
c(1, 2, 3, 4)
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


Läs mer om datastrukturer
========================================================

- [Advanced R programming - Data structures](http://adv-r.had.co.nz/Data-structures.html)


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
```

```
 aa  bb 
2.1 4.2 
```

```r
x[order(x)] # Välj alla element, sorterade
```

```
 aa  cc  bb  dd 
2.1 3.3 4.2 5.4 
```

```r
x[['aa']] # Välj ett, namngivet eller numrerat, element
```

```
[1] 2.1
```


Listor
========================================================

Listor fungerar ungefär som vektorer, men samma metoder fungerar inte alltid.

Data:

```r
ll <- list(2.1, 4.2, 3.3, 5.4)
```


Metoder för dataextrahering:

```r
ll[c(1,2)]
```

```
[[1]]
[1] 2.1

[[2]]
[1] 4.2
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





