# Quarterly check-in template generator - a utility package 📦

This is a helper R package to generate quarterly check-in templates for your team members. This is intended to be run once a year and will create four files per name supplied.

## Installation

To install this package, copy and paste the below code into the R terminal

```r
install.packages("pak")  # this lets you easily install packages from github
pak::pak("sen-kaustav/checkinTemplate")
```
In addition to the above, you will also need to have quarto install. Follow the instructions [here](https://quarto.org/docs/get-started/).

## Usage

The simplest way to use this package is to navigate to the folder location where you would like the templates to be saved and then run the below.

```r
library(checkinTemplate)
names <- c("Sam", "Joan", "Peter")  # add as many names as required
generate_templates(names)
```
Alternatively, you can also provide a link to where you would like the files to be saved.

```r
output_location <- "path/to/folder"
generate_templates(names, output_dir = output_location)
```

By default the files will be generated with year based on the system date. For example, if you are running this code in 2026, the files will be created as [Name]_Q126, [Name]_Q226, and so on. However, in the rare scenario that you would like to control the year too, this can be done as follows:

```r
generate_templates(names, output_dir = output_location, year = 2025)
```
