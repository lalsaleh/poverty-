
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Lujain

<!-- badges: start -->

<!-- badges: end -->

The goal of Lujain is to …

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lalsaleh/poverty-")
```

## Use *World Data Institute* (WDI) Data to Explore Poverty

### Primary Aim:

Poverty and health equity is a major health topic. It is important for
policy makers to make decisions based on data. My app will provide an
interface to health and poverty data and analysis. Using this data might
help them to find out what policy will work.

### Concept

The data is be taken from the World Data Bank (WDB). Using the R app
`WDI` to download the data as the user requests it.

WDB has lots of data, but the app presents the user with a good
selection of that data. This saves the user from having explore the
thousands of series on the website.

The series can be categorized as follows (The user will choose from
options in these categories):

**Outcome measure:**

Outcome measurements related to poverty or economic health such as GINI
index.

**Intervention:**

Measurements of government intervention or things can be modified by
government policies such as Income share held by fourth 20%. For
example, the democrats claim that they can improve this number.

**Confounders:**

Variables that cannot be modified by government policies such as age
distribution, or ethnic variety. These will be used to adjust measures
of the association between interventions and outcomes.

### The Data

The main data set is called `h`. This contains selected series from the
WDI website. One of the difficulties is finding series that have data.
