
library(ggplot2)
library(plyr)
library(lattice)

## Import the data created in the first script.
sgDat <- read.delim("gapminderDataSorted.txt")
## Make sure your new continent order is still in force. 
levels(sgDat$continent)
## head(sgDat)

##Fit a linear regression of life expectancy on year within each country. Write the estimated intercepts, slopes, and residual error variance (or sd) to file.

write.table( ldply (dlply(sgDat, ~country+continent, lm, formula = lifeExp ~ year ), function(x) {
  c(coef(x) ,
  "sd" = summary(x)$sigma)

  }),
            "lifeExpOnYearRegResult.txt", quote = FALSE,
            sep = "\t", row.names = FALSE,col.names=TRUE)

##Find the "worst" and "best" countries for each continent.(assuing no countries share the same sd)
leReg <- read.delim("lifeExpOnYearRegResult.txt")
leReg <- data.frame(leReg)

extremRegDat <- ddply(leReg, ~ continent, function(x) {
  ##sd <- range(x$sd)
  ## return(data.frame(sd, stat = c("best", "worst")))
  best_sd <- tail(sort(x$sd),3)
  worst_sd <- head (sort(x$sd),3)
  return(x[which(x$sd %in% best_sd | x$sd %in% worst_sd),])
  })

##Write the linear regression info for just these countries to file.
write.table(extremRegDat,
            "WorstBestCountries.txt", quote = FALSE,
            sep = "\t", row.names = FALSE)
##Create a single-page figure for each continent, including data only for the 6-8 "extreme" countries, and write to file. One file per continent, with an informative name. The figure should give scatterplots of life expectancy vs. year, panelling/facetting on country, fitted line overlaid.
extremCountries <- as.vector(extremRegDat$country)
extremSgDat <- subset(sgDat, country %in% extremCountries)
##extremSgDat

d_ply(extremSgDat, ~ continent, function(z) {
  
  theContinent <- z$continent[1]  
  p <- ggplot(z, aes(x = year, y = lifeExp)) + scale_y_log10() + geom_smooth(method = "lm")+
  ggtitle(theContinent) + facet_wrap(~country) + 
  geom_jitter(alpha = 1/2, position = position_jitter(width = 0.1))
 theContinent <- gsub(" ", "_", theContinent)  
 png(paste0("scatterplot_extremLifeYearReg_", theContinent, ".png"))
  print(p)
  dev.off()
})

