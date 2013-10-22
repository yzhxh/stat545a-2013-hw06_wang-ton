## one Makefile to make them all


gapminderDataSorted.txt XyPlotLifeExp.png BoxPlotGdpPerCap.png:	gapminderDataFiveYear.txt stat545a-2013-hw06_wang-ton-script01.R
	Rscript stat545a-2013-hw06_wang-ton-script01.R

scatterplot_extremLifeYearReg_*.png lifeExpOnYearRegResult.txt WorstBestCountries.txt: gapminderDataSorted.txt stat545a-2013-hw06_wang-ton-script02.R
	Rscript stat545a-2013-hw06_wang-ton-script02.R
clean:
	rm -f gapminderDataSorted.txt  lifeExpOnYearRegResult.txt WorstBestCountries.txt  *.png
	

