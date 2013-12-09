require(RJSONIO)
require(rCharts)
require(lubridate)

#url <- "http://data.riksdagen.se/personlista/?iid=&fnamn=&enamn=&f_ar=&kn=&parti=&valkrets=&rdlstatus=&org=&utformat=json&termlista="
url <- "data/personlista.json"
json <- readLines(url, warn = FALSE)

persons <- fromJSON(json)$personlista

prepareData <- function(lst, fun) {
  res <- lapply(lst, fun)
  splitVector <- sapply(res, function(p) p$color)
  res <- split(res, splitVector)
  res <- lapply(res, function(x) {
    list(data = x, name = x[[1]]$color)
  })
  names(res) <- NULL
  return(res)
}

fun <- function(p) {
  list(
    x = year(Sys.Date())-p$fodd_ar, 
    y = 1, 
    color = p$parti,
    text = paste(p$tilltalsnamn, p$efternamn),
    url = p$bild_url_80,
    valkrets = p$valkrets
  )
}
data <- prepareData(persons, fun)

a <- rCharts::Highcharts$new()
a$series(data)
a$plotOptions(
  scatter = list(
    marker = list(
      symbol = "circle", 
      radius = 4
    )
  ),
  series = list(stacking = "normal")
)
a$tooltip(
  useHTML = T,
  formatter = "#! function() {
    return '<table height=84><tr><td>'
    + '<img src=\"'
    + this.point.url
    + '\" height=80 width=60></td><td>'
    + this.point.text + '<br>' + this.point.x + ' år<br>' + this.point.valkrets
    + '</td></tr></table>';} !#"
)
a$chart(type = "scatter")
a$xAxis(title = list(text = "Ålder vid årets början"))
a$yAxis(title = list(text = "Antal ledamöter"), min = 0, max = 20)
# a$legend(
#   align = 'top'#, 
#   #verticalAlign = 'middle', 
#   #layout = 'vertical', 
#   #title = list(text = "Politiskt parti")
# )
a$title(text = "Riksdagsledamöter 2013")
a$credits(href = "http://data.riksdagen.se/", text = "Källa: Riksdagens API")
a$colors(
  'rgba(223, 83, 83, .5)', 
  'rgba(60, 179, 113, .5)', 
  'rgba(238, 130, 238, .5)', 
  'rgba(30, 144, 255, .5)', 
  'rgba(139, 10, 10, .5)',
  'rgba(55, 20, 90, .5)',
  'rgba(178, 230, 66, .5)',
  'rgba(211, 15, 15, .5)'
)

a
