stat545a-2013-hw06_wang-ton
===========================
This is a anlytical piipline based on GapminderData. 
To replicate my analysis: 
* Dowload the following files into an emplty directory. 
  - Input data: [`gapminderDataFiveYear.txt`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/gapminderDataFiveYear.txt)
  - Scripts: [`stat545a-2013-hw06_wang-ton-script01.R`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/stat545a-2013-hw06_wang-ton-script01.R) and [`stat545a-2013-hw06_wang-ton-script02.R`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/stat545a-2013-hw06_wang-ton-script02.R)
  - Makefile: [`makefile`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/makefile.r)

* Running `make -f makefile.r` in a shell. 
* New files you should see: 
  - [`XyPlotLifeExp.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/XyPlotLifeExp.png)
  - [`BoxPlotGdpPerCap.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/BoxPlotGdpPerCap.png)
  - [`gapminderDataSorted.txt`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/gapminderDataSorted.txt)
  - [`lifeExpOnYearRegResult.txt`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/lifeExpOnYearRegResult.txt)
  - [`WorstBestCountries.txt`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/WorstBestCountries.txt)
  - [`scatterplot_extremLifeYearReg_Africa.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/scatterplot_extremLifeYearReg_Africa.png)
  - [`scatterplot_extremLifeYearReg_Americas.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/scatterplot_extremLifeYearReg_Americas.png)
  - [`scatterplot_extremLifeYearReg_Asia.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/scatterplot_extremLifeYearReg_Asia.png)
  - [`scatterplot_extremLifeYearReg_Europe.png`](https://github.com/yzhxh/stat545a-2013-hw06_wang-ton/blob/master/scatterplot_extremLifeYearReg_Europe.png)
* To remove the output and get a clean slate, in a shell: `make -f makefile.r clean`
  
