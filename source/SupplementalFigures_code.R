# This file reproduces Supplemental Figures 1-2 in "Migration, hotspots, and dispersal of HIV infection in Rakai Uganda"

# Read in data 
  load("./data/MigrationNetwork_Figure1_SupplementalFigures_data.rda")


# Supplemental Figure 1A: Plot Female age specific probablity of being an outmigrant 

  ## Women in agrarian communities
    fem.femage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="F" 
                                                                                       & r15_census$comtype==0,],)
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    plot(fem.femage.data$upper~fem.femage.data$ageyrs, type="l", lty=1, col="white", 
         xlab="Female age (years)", ylab="Probability of being a recent out-migrant at RCCS R16", ylim=c(0.0,0.6), xlim=c(16,48))
    r<-fem.femage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "palegreen3", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, lwd=2, col="seagreen", ylim=c(0.0,0.1))

  ## Women in trading communities
    fem.femage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="F" 
                                                                                       & r15_census$comtype==1,])
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    r<-fem.femage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "lightgoldenrod1", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, col="darkgoldenrod1", ylim=c(0.0,0.1))
    

  ## Women in fishing communities
    fem.femage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="F" 
                                                                                       & r15_census$comtype==2,])
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    r<-fem.femage.data$ageyrs
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "lightblue2", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, col="dodgerblue2", ylim=c(0.0,0.1))
    

# Supplemental Figure 1B: Plot Male age specific probablity of being an outmigrant 

  ## Men in agrarian communities
    man.manage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="M" 
                                                                                       & r15_census$comtype==0,])
    myval<-seq(15,49, by=0.01)
    man.manage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(man.manage, newdata=man.manage.data, type='response', se=T)
    man.manage.data$fits = fits$fit
    man.manage.data$se.fit=fits$se.fit
    man.manage.data$upper<-man.manage.data$fit + 1.96*man.manage.data$se.fit
    man.manage.data$lower<-man.manage.data$fit - 1.96*man.manage.data$se.fit
    plot(man.manage.data$upper~man.manage.data$ageyrs, type="l", lty=1, col="white", 
         xlab="manale age (years)", ylab="Probability of being a recent out-migrant at RCCS R16", ylim=c(0.0,0.6), xlim=c(16,48))
    r<-man.manage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(man.manage.data$upper, rev(man.manage.data$lower)),
            col = "palegreen3", border = NA)
    lines(man.manage.data$fit~man.manage.data$ageyrs, type="l", lty=1, lwd=2, col="seagreen", ylim=c(0.0,0.1))


  ## Menin trading communities
    man.manage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="M" 
                                                                                       & r15_census$comtype==1,])
    myval<-seq(15,49, by=0.01)
    man.manage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(man.manage, newdata=man.manage.data, type='response', se=T)
    man.manage.data$fits = fits$fit
    man.manage.data$se.fit=fits$se.fit
    man.manage.data$upper<-man.manage.data$fit + 1.96*man.manage.data$se.fit
    man.manage.data$lower<-man.manage.data$fit - 1.96*man.manage.data$se.fit
    r<-man.manage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(man.manage.data$upper, rev(man.manage.data$lower)),
            col = "lightgoldenrod1", border = NA)
    lines(man.manage.data$fit~man.manage.data$ageyrs, type="l", lty=1, col="darkgoldenrod1", ylim=c(0.0,0.1))

  ## Men in fishing communities
    man.manage <- gam(outmigrant ~ s(ageyrs),family=binomial(link=log),data=r15_census[r15_census$sex=="M" 
                                                                                       & r15_census$comtype==2,])
    myval<-seq(15,49, by=0.01)
    man.manage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(man.manage, newdata=man.manage.data, type='response', se=T)
    man.manage.data$fits = fits$fit
    man.manage.data$se.fit=fits$se.fit
    man.manage.data$upper<-man.manage.data$fit + 1.96*man.manage.data$se.fit
    man.manage.data$lower<-man.manage.data$fit - 1.96*man.manage.data$se.fit
    r<-man.manage.data$ageyrs
    polygon(c(r, rev(r)), c(man.manage.data$upper, rev(man.manage.data$lower)),
            col = "lightblue2", border = NA)
    lines(man.manage.data$fit~man.manage.data$ageyrs, type="l", lty=1, col="dodgerblue2", ylim=c(0.0,0.1))

# Supplemental Figure 2 - Shannon Entropy
  par(mfrow=c(1,2))
  boxplot(community_migrationData$ise1~community_migrationData$comtype, names=c("Agrarian", "Trading", "Fishing"), 
          col=c("seagreen", "darkgoldenrod1", "dodgerblue2"), ylab="Shannon entropy score, in-migrants", ylim=c(0,3))
  boxplot(community_migrationData$ose1~community_migrationData$comtype, names=c("Agrarian", "Trading", "Fishing"), ylim=c(0,3),
          col=c("seagreen", "darkgoldenrod1", "dodgerblue2"), ylab="Shannon entropy score, out-migrants")