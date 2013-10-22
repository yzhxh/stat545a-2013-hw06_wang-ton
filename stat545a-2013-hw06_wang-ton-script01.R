library(ggplot2)
library(plyr)
library(lattice)

## data import
# gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"

gDat <- read.delim("gapminderDataFiveYear.txt")
gDat <- droplevels(subset(gDat, continent!="Oceania"))


## Trend of life Expectancy 
png("XyPlotLifeExp.png" )
p <- xyplot(lifeExp ~ year, gDat, groups = continent, jitter.data = TRUE,auto.key = list(column=4), grid = "h", type=c('p','r'),
       main= "Trend of Life Expectancy")
print(p)
dev.off()

## boxplot of gdpPerCap
png("BoxPlotGdpPerCap.png")
par(mar = c(6.5, 6.5, 0.5, 0.5), mgp = c(5, 1, 0))
q <- bwplot(log(gdpPercap) ~ reorder(year,gdpPercap)|continent, gDat, layout = c(4,1), presnel= function(..., box.rrestio) {
  panel.violin(..., col = "transparent", border = "grey60",
               varwidth = TRUE, box.ratio = box.ratio)
  panel.bwplot(..., fill = NULL, box.ratio = .1)
} ,main="Boxplot of GDP per capital for each continent", xlab="year")
print(q)
dev.off()

## TrimMean function
jTrim=0.1
myTrimMean <- function (x){
  mean(x,trim=jTrim)
}
## reorder the continents based on life expectancy (decreasing)
gDat <- within(gDat, continent <- reorder(continent, -lifeExp, myTrimMean))
##levels(gDat$continent)

##reorder country based on population (decreasing)
##oldCountry <- levels (gDat$country)
##oldCountry
gDat <- within(gDat, country <- reorder(country, -pop, myTrimMean))
##levels(gDat$country)

## Sort the actual data in (implement the ordering of life expectancy)
## reorder data itself
gDat <- arrange(gDat, continent,country)
##tail(gDat)

## Write the Gapminder data to file(s), for immediate and future reuse.
write.table (gDat,"gapminderDataSorted.txt",quote =FALSE,sep = "\t")
