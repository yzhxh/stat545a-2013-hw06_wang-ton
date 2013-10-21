## one Makefile to make them all


gapminderDataSorted.txt XyPlotLifeExp.png BoxPlotGdpPerCap.png:	gapminderDataFiveYear.txt stat545a-2013-hw06_wang-ton-script01.R
	Rscript stat545a-2013-hw06_wang-ton-script01.R

scatterplot_wordsByRace_*.png lifeExpOnYearRegResult.txt WorstBestCountries.txt: lotr_clean.tsv 02_aggregatePlot.R
	Rscript stat545a-2013-hw06_wang-ton-script02.R
clean:
	rm -f gapminderDataSorted.txt  lifeExpOnYearRegResult.txt WorstBestCountries.txt  *.png
	

