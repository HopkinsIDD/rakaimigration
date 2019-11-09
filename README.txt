---
title: "Migration, hotspots, and dispersal of HIV infection in Rakai Uganda"
author: "M. Kate Grabowski"
date: "November 8, 2019"
output: html_document
---

This repository provides the source code and supplementary material to reproduce the figures for a study on migration and HIV in southern Uganda. Please note that due to IRB requirements, we could not provide individual level data on HIV outcomes; thus, aggregate data are provided in most cases to reproduce manuscript figures. Please contact M. Kate Grabowski with any questions/comments or concerns at mgrabow2@jhu.edu

# Data use agreements 
These data should be used to reproduce figures only. **Any use of these data beyond the aforementioned utility will require authorization from the Rakai Health Sciences Program (rhsp.org).** 

# Abbreviations
  * RCCS=Rakai Commmunity Cohort Study
  
# R packages required 
1. `raster`
2. `ggplot2`
3. `igraph`
4. `gplots`
5. `mgcv`
6. `RColorBrewer`

# Source code

The source code for the figure presented in the manuscript may be found in `source/`. The input data to run the source code may be found in `data/`.

Descriptions of the files are as follows:  

1. `Figure1_code.r`: Reproduces Figures 1A-D from main manusript  
2. `Figure2_code.r`: Reproduces Figures 2A-F from main manusript 
3. `Figure3_code.r`: Reproduces Figures 3A and 3C from main manusript 
4. `Figure4A_code.r`: Reproduces Figure 4A from main manusript 
5. `Figure4B_code.r`: Reproduces Figure 4B from main manusript 
6. `Figure4C_code.r`: Reproduces Figure 4c from main manusript 
7. `Figure5_code.r`: Reproduces Figure 5 from main manusript 
8. `SupplementalFigures_code.r`: Reproduces Supplemental Figures 1-2 

# Input Data

The input data files to reproduce the figures may be found in `data/`. 

## Figure 1 and Supplemental Figures Data 
Data to reproduce Figures 1A-D and Supplemental Figures 1-2 can be found in `MigrationNetwork_Figure1_SupplementalFigures_data.rda`. This file contains 5 datasets described below. Please see codebook for more details on variable descriptions in these datasetes.  

  * `community_MigrationData`: Dataframe summarzing migration key metrics from 38 communities
  * `r16_census`: Dataframe of censused individuals in RCCS survey round 16, 15-49 years, in 38 communties; 
  * `r16_survey`: Dataframe of surveyed individuals in RCCS survey round 16, 15-49 years, in 38 communties; 
  * `r15_census`: Dataframe of censused individuals in RCCS survey round 15, 15-49 years, in 38 communties; 
  * `r15_survey`: Dataframe of surveyed individuals in RCCS survey round 15, 15-49 years, in 38 communties; 
  
## Figure 2 Data 
Data to reproduce Figure can be found in `MigrationNetwork_Figure2_data.rda`. This file contains 6 datasets corresponding to each of the 6 panels. The datasets are described below. Within each dataset there are estimates of the mean HIV prevalence (ami_mean), lower 95% CI for HIV prevalence estimate (ami_low), upper 95%CI for HIV prevalence estimate (ami_up), age group indicator (agevec, with 1 corresponding to youngest age group and 6 the oldest age group), number of HIV positive cases (n_infected), and total number of HIV positive and negative cases all corresponding to the designatd subgroup (n_total). 

  * `fagro` : Femle HIV prevalence estimates for long-term resident, inmigrants, and outmigrants in agrarian communities 
  * `ftrade` : Female HIV prevalence estimates for long-term resident, inmigrants, and outmigrant in trading communities 
  * `ffish` : Female HIV prevalence estimates for long-term resident, inmigrants, and outmigrant in trading communities 
  * `magro` : Male HIV prevalence estimates for long-term resident, inmigrants, and outmigrants in agrarian communities 
  * `mtrade` : Male HIV prevalence estimates for long-term resident, inmigrants, and outmigrant in trading communities 
  * `nfish` : Male HIV prevalence estimates for long-term resident, inmigrants, and outmigrant in trading communities 
  
## Figure 3 Data
Data to reproduce Figures 3A and C be found in `MigrationNetwork_Figure3_data.rda`. This file contains 2 datasets described below.   

  * `newcase_table`: Table of raw aggregate data denoting sources of newly identified cases in RCCS R16  
  * `sourcecase_table`: Table of raw aggregate data denoting geographic sources of newly identified HIV cases originating outside the Rakai study area 
  
  
## Figure 4A Data
Data to reproduce Figures 3A  be found in `MigrationNetwork_Figure4A_data.rda`. This file contains 14 datasets described below.    

* `ptab`:matrix; # of surveyed HIV infected inmigrants in a given destination sub-district (row) by place of origin (column); only selected places of origin included 
* `ntab`: matrix; # of surveyed inmigrants in a given destination sub-district(row) by place of origin (column); only selected places of origin included 
* `prevmat`: matrix; prevalence of HIV among survyed inmigrants by destination sub-district (row) and place of origin (column)
* `subpop`: vector; total population size in sub-district; estimated from world pop
* `subtime` : vector; median time in years (across all surveys interview dates) between R15 and R16 surveys in a given sub-district
* `subsize`: vector; Average size of surveyed population in sub-district over R15 and R16 surveys
* `totpop`: vector; total # of surveyed participants in sub-district in R16
* `totmig`: vector; total # of inmigrant participants in sub-district in R16
* `mrate`: matrix; rate of migration from source location into a given sub-district; defined as number of migrants into the district/Total person-time  (ntab[i,]/(subsize[i]*subtime[i]))
* `mfreq`: matrix; estimated total number of in-migrants moving into the sub-district from source location between R15 and R16 (ntab[i,]/(subsize[i]*subtime[i]))*subpop[i]
* `totrate`: vector; Rate of migration into sub-district overall source location [totmig/(totpop*subtime)]
* `totevent`: vector; Estimated total number of in-migrants moving into sub-district overall source location [totrate*subpop]
* `coords`: Coordinates of sub-districts for plotting 
* `subdis_hivprev` = Estimated HIV prevalence in sub-district; No. of HIV positive participants in subdistrict in R16/total number of participants in subdistrict in R16 

## Figure 4B Data
Data to reproduce Figures 4B be found in `MigrationNetwork_Figure4B_data.rda`. This file contains the dataset described below.  

* `community_HIVprevalenceData`: dataset indicating the prevalence of HIV among inmigrants and outmigrants for the 38 communities 

## Figure 4C Data
Data to reproduce Figures 4C be found in `MigrationNetwork_Figure4C_data.rda`. This file contains 6 datasets described below.  
  
* `fembar`:  Mean HIV prevalence among female inmigrants and outmigrants by location; Estimates obtained using Poisson regression 
* `fembar.low`: Lower 95% CI for HIV prevalence among female inmigrants and outmigrants by location; Estimates obtained using Poisson regression 
* `fembar.high`: Upper 95% CI for HIV prevalence among female inmigrants and outmigrants by location; Estimates obtained using Poisson regression 
* `manbar`: Mean HIV prevalence among male inmigrants and outmigrants by location; Estimates obtained using Poisson regression  
* `manbar.low`: Low 95% CI for HIV prevalence among male inmigrants and outmigrants by location; Estimates obtained using Poisson regression 
* `manbar.high`: Upper 95% CI for HIV prevalence among male inmigrants and outmigrants by location; Estimates obtained using Poisson regression 


## Figure 5 Data
Data to reproduce Figures 5 can be found in `MigrationNetwork_Figure5_data.rda`. This file contains 5 datasets described below.  

* `mat1`: Mean HIV prevalence among female and male inmigrants to fishing communities by time since arrival; estimated using Poisson regression
* `mat2`: Lower 95% CI for HIV prevalence among female and male inmigrants to fishing communities by time since arrival; estimated using Poisson regression
* `mat3` : Upper 95% CI for HIV prevalence among female and male inmigrants to fishing communities by time since arrival; estimated using Poisson regression
* `femalefish.data.hivprev`: Aggregated raw data from women summarizing HIV positive and negative outcomes used to generate female prevalence estimates  
* `malefish.data.hivprev`: Aggregated raw data from men summarizing HIV positive and negative outcomes used to generate generate prevalence estimates 
  
  
  