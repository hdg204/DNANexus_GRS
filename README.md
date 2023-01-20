# DNANexus GRS

## Description

This repository contains a function to calculate a genetic risk score in the UK Biobank cohort, using the DNA Nexus platform. It contains one function, Calculate_GRS.R, which takes one input, a file with a list of chromosome, base pair, other allele, effect allele, and weight, and returns a data frame with two columns, eid and grs,

## Example script

This script has been written to run on the RStudio Workbench on DNA Nexus, which at the time of writing runs First, run

`library(devtools)`
`source_url("https://raw.githubusercontent.com/hdg204/DNANexus_GRS/main/Calculate_GRS.R")`



