# This file reproduces Figures 2A -F in "Migration, hotspots, and dispersal of HIV infection in Rakai Uganda"

# Read in data 
  load("./data/MigrationNetwork_Figure2_data.rda")

# Load relevant libraries 
  library(ggplot2)

# Create a vector indicating the unique age categories 

# Create a figure of female HIV prevalence data in agrarian communtiies using fagro dataset
  pd <- position_dodge(width=0.5)
  p1<-ggplot(fagro, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19, 15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1), breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Female HIV Prevalence, Agrarian communities")

# Create a figure of female HIV prevalence data in trading communtiies using ftrade dataset 
  pd <- position_dodge(width=0.5)
  p2<-ggplot(ftrade, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19, 15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1), breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Female HIV Prevalence, Trading communities")

## Create a figure of female HIV prevalence data in fishing communtiies using ffsih dataset 
  pd <- position_dodge(width=0.5)
  p3<-ggplot(ffish, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19, 15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1), breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Female HIV Prevalence, Fishing communities")
  
## Create a figure of male HIV prevalence data in agrarian communtiies using magro dataset
  pd <- position_dodge(width=0.5)
  p4<-ggplot(magro, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19,15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1),breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Male HIV Prevalence, Agrarian communities")
  
## Create a figure of male HIV prevalence data in trading communtiies using mtrade dataset
  pd <- position_dodge(width=0.5)
  p5<-ggplot(mtrade, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19, 15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1),breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Male HIV Prevalence, Trading communities")
  
# Create a figure of male HIV prevalence data in fishing communtiies using mfish dataset
  pd <- position_dodge(width=0.5)
  p6<-ggplot(mfish, aes(agevec,ami_mean, color=migrant)) +
    geom_point(aes(shape=migrant),size=3, position=pd) + 
    scale_color_manual(name="Migrant status",values=c("coral","steelblue", "purple")) + 
    scale_shape_manual(name="Migrant status",values=c(17,19, 15)) + 
    theme_gray() + 
    scale_x_continuous("Age group", breaks=1:length(agevec), labels=c("15-19", "20-24", "25-29", "30-34", "35-39", "40+")) + 
    scale_y_continuous("HIV prevalence", limits=c(0,1),breaks=seq(0,1,by=0.1)) +
    geom_errorbar(aes(ymin=ami_low,ymax=ami_up),width=0.25,position=pd) +
    ggtitle("Male HIV Prevalence, Fishing communities")
  
  source("http://peterhaschke.com/Code/multiplot.R")
  multiplot(p1,p4,p2,p5,p3,p6, cols=3)

  
  
  
  