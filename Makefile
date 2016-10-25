.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

data_cleaning_script = code/scripts/data-processing-script.R
train_test_split_script = code/scripts/train-test-split-script.R
report_sections = sections/*.Rmd
DATA = $(data/Credit.csv)

all: data eda session regressions report slides

# download data from web & data cleaning & split data into train set and test set 
# for model training
data: $(data_cleaning_script) $(train_test_split_script)
	cd data && curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv
	RScript $(data_cleaning_script)
	RScript $(train_test_split_script)

# run exploratory data analysis on downloaded data set
eda: code/scripts/eda-script.R 
	RScript $<

# exploring data through simple linear regression 
ols: code/scripts/ols-regression-script.R $(DATA)
	RScript $<
	
# exploring data through Ridge regression 	
ridge: code/scripts/ridge-regression-script.R $(DATA)
	RScript $<

# exploring data through Lasso regression 
lasso: code/scripts/lasso-regression-script.R $(DATA)
	RScript $<
	
# exploring data through Principal Components regression
pcr: code/scripts/pcr-regression-script.R $(DATA)
	RScript $<

# exploring data through Partial Least Squares regression
plsr: code/scripts/plsr-regression-script.R $(DATA)
	RScript $<

# run all regression scripts
regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

# generate session information including system spec and required packages
session: code/scripts/session-info-script.R
	RScript $<

# assemble sections of report into one and convert it to PDF format
report:
	cd report; pandoc -o report.Rmd $(report_sections)
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'pdf_document')"
	
# convert report to slides
slides:
	Rscript -e "library(rmarkdown); render('report/report.Rmd', 'ioslides_presentation')"

# remove existing report and slides
clean:
	rm -f report/report.pdf
	rm -f report/report.html