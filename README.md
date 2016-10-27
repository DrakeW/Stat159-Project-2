# Stat159 Project 2

Introduction
---
In this project, we applied model selection methods on different regression models introduced in _Chapter 6: Linear Model Selection and Regularization (from **"An Introduction to Statistical Learning"** by James et al)_. The 5 regression models we practiced are _Ordinary Least Squares, Ridge Regression, Lasso Regression, Principle Components Regression and Partial Least Square Regression_. In order to find the best parameter (or coefficients) for those regression models, we splitted our datasets into train and test groups, performed 10-fold cross validation on each model respectively, and in the end chose the best model with the least cross-validation error.

Project Structure
---
Contents are separated into five main sections (with each section corresponding to a directory)
* **Code** -- this is where regression scripts & utility functions & unit tests locate.
* **Data** -- data downloaded from the internet & created by code are stored in this directory.
* **Images** -- images created by exploratory analysis & regression are stored in this direcotry.
* **Report** -- contains a **section** sub-directory that includes all sections of the final report in separate files and final report is dynamically generated and stored here.
* **Slides** -- slides are dynamically generated and stored here.

And the file strucutre of this project is like the following
```
Stat159-Project-2/
	.gitignore
	README.md
	Makefile
	LICENSE
	report/
		sections/
			00-abstract.Rmd
			01-introduction.Rmd
			02-data.Rmd
			03-methods.Rmd
			04-analysis.Rmd
			05-results.Rmd
			06-conclusions.Rmd
		report.Rmd
		report.pdf
	images/
		... (dynamically generated images)
	data/
	    Credit.csv
	    ... (dynamically generated data)
	code/
	    functions/
	        ... (utility functions)
	    scripts/
	        ... (regression scripts)
	    tests/
	        ... (unit tests against utility functions)
	 slides/
	    ...
	 session-info.txt (system info)
```

Instruction to Reproduce
---
This project can be reproduced by following the instructions below.

1. Download/Clone this project from GitHub (unzip if downloaded file is in zip format)
2. Open **terminal** or any shell program that supports standard **linux commands**
3. `cd Stat159-Project-2`
4. `make clean` to remove old compiled artifact
5. `make` to generate new artifact
6. open `report.pdf` with PDF viewer of your choice

`Make` Summary
---
This section includes description of different make commands that you can use to reproduce corresponding part of this project

1. `make all` reproduce the entire projects -- download data, run regression analysis, aseemble report etc
2. `make data` downlaod data from internet, run data cleaning script, split data into train set and test set
3. `make eda` run exploratory data analysis script
4. `make ols` run OLS regression script and save result
5. `make ridge` run Ridge regression script and save result
6. `make lasso` run Lasso regression script and save result
7. `make pcr` run PCR regression script and save result
8. `make plsr` run PLSR regression script and save result
9. `make regressions` run all regression model scripts together
10. `make session` run session info script and store system & package infromation into session-info.txt
11. `make report` assemble report from Rmd files in sections and transform to PDF format
12. `make slides` create slides from Rmd files
13. `make clean` remove old artifacts
14. `make tests` to run unit test in _tests_ directory


Author
---
Junyu Wang

Nichole Ann Rethmeier

License
---
![](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

ALl media content is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/.)

All code is licensed under **MIT license**.
