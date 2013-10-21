
library(ggplot2)
library(plyr)
library(lattice)

## Import the data created in the first script.
sgDat <- read.delim("gapminderDataSorted.txt")
## Make sure your new continent order is still in force. 
levels(sgDat$continent)
head(sgDat)

##Fit a linear regression of life expectancy on year within each country. Write the estimated intercepts, slopes, and residual error variance (or sd) to file.

write.table( ldply (dlply(sgDat, ~country+continent, lm, formula = lifeExp ~ year ), function(x) {
  c(coef(x) ,
  "sd" = summary(x)$sigma)

  }),
            "lifeExpOnYearRegResult.txt", quote = FALSE,
            sep = "\t", row.names = FALSE,col.names=TRUE)

##Find the "worst" and "best" countries for each continent.
leReg <- read.delim("lifeExpOnYearRegResult.txt")
leReg <- data.frame(leReg)
extremgDat <- ddply(leReg, ~ continent, function(x) {
  sd <- range(x$sd)
  return(data.frame(sd, stat = c("best", "worst")))
})
extremSd <- as.vector(extremgDat$sd)
wbsgDat <- leReg[which( leReg$sd %in% extremSd),]

##Write the linear regression info for just these countries to file.
write.table(wbsgDat,
            "WorstBestCountries.txt", quote = FALSE,
            sep = "\t", row.names = FALSE)
##Create a single-page figure for each continent, including data only for the 6-8 "extreme" countries, and write to file. One file per continent, with an informative name. The figure should give scatterplots of life expectancy vs. year, panelling/facetting on country, fitted line overlaid.
d_ply(wbsDat, ~ Film, function(z) {
  theCountry <- z$country[1]
p <- ggplot(wbsgDat, aes(x = year, y = lifeExp)) + scale_y_log10() + geom_smooth(method = "lm")+
  ggtitle(theCountry) + facet_wrap(~continent) + 
  geom_jitter(alpha = 1/2, position = position_jitter(width = 0.1))
 theCountry <- gsub(" ", "_", theCountry)
 png(paste0("scatterplot_wordsByRace_", theCountry, ".png"))
  print(p)
  dev.off()
})

