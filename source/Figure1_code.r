# Load library
  library("mgcv")

# Plot Figure 1A: In-migration rates vs. out-migration rates
  plot(community_migrationData$inrate~community_migrationData$outrate, ylim=c(0,25), xlim=c(0,25), pch=21, bg="seagreen", 
       xlab=c("Out-migration rate per 100 person years"), ylab=c("In-migration rate per 100 person years"), cex=2)
  abline(h=seq(0, 25,5), col="gray80", lty=2, lwd=0.8)
  abline(v=seq(0, 25,5), col="gray80", lty=2, lwd=0.8)
  points(community_migrationData$inrate[community_migrationData$comtype==0]~community_migrationData$outrate[community_migrationData$comtype==0], pch=21, cex=2, bg="seagreen")
  points(community_migrationData$inrate[community_migrationData$comtype==1]~community_migrationData$outrate[community_migrationData$comtype==1], pch=21, cex=2, bg="darkgoldenrod1")
  points(community_migrationData$inrate[community_migrationData$comtype==2]~community_migrationData$outrate[community_migrationData$comtype==2], pch=21, cex=2, bg="dodgerblue2")
  abline(a=0,b=1, lty=3, lwd=2)
  x<-community_migrationData$outrate
  y<-community_migrationData$inrate
  mylm<-lm(y~x)  
  abline(mylm, col="red", lwd=2)
  newx <- seq(0,30)
  preds <- predict(mylm, newdata = data.frame(x=newx), 
                   interval = 'confidence')
  lines(newx, preds[ ,3], lty = 'dashed', col = 'red')
  lines(newx, preds[ ,2], lty = 'dashed', col = 'red')
  
  abline(h=0, col="black")
  legend("topleft", legend=c("Agrarian community", "Trading community", "Fish landing site"), 
         col=c("seagreen", "darkgoldenrod1", "dodgerblue2"), cex=1.3, pch=19, bty="n")

  
# Figure 1B: Plot cumulative distribution functions (CDFs) for migration distance
  ## Cutpoints for cdf analysis
    x=log10(c(1, 5,10, 25, 50,75,100,150,200))
  
  ## CDFs for agrarian communities 
    afun<-ecdf(log10(r16_survey$indis[which(!is.na(r16_survey$indis) & r16_survey$comtype==0)]))
    afun<-1-afun(x)
    afun2<-ecdf(log10(r15_survey$outdis[which(!is.na(r15_survey$outdis) & r15_survey$comtype==0)]))
    afun2<-1-afun2(x)
  
  ## CDFs for trading communities 
    tfun<-ecdf(log10(r16_survey$indis[which(!is.na(r16_survey$indis) & r16_survey$comtype==1)]))
    tfun<-1-tfun(x)
    tfun2<-ecdf(log10(r15_survey$outdis[which(!is.na(r15_survey$outdis) & r15_survey$comtype==1)]))
    tfun2<-1-tfun2(x)
    
  ## CDFs for fishing communities 
    ffun<-ecdf(log10(r16_survey$indis[which(!is.na(r16_survey$indis) & r16_survey$comtype==2)]))
    ffun<-1-ffun(x)
    ffun2<-ecdf(log10(r15_survey$outdis[which(!is.na(r15_survey$outdis) & r15_survey$comtype==2)]))
    ffun2<-1-ffun2(x)
  
  plot(afun~x, type="b", pch=1, col="seagreen", lwd=2, axes=F, cex=1.5, xlab="d", ylab="proportion d from former residence")
  lines(afun2~x, type="b", pch=19, col="seagreen", lwd=2, cex=1.5)
  
  lines(tfun~x, type="b", pch=2, col="darkgoldenrod1", lwd=2, cex=1.5)
  lines(tfun2~x, type="b", pch=17, col="darkgoldenrod1", lwd=2, cex=1.5)
  
  lines(ffun~x, type="b", pch=0, col="dodgerblue2", lwd=2)
  lines(ffun2~x, type="b", pch=15, col="dodgerblue2", lwd=2)
  
  axis(1, at=x, labels=c("1km", "5km", "10km", "25km", "50km","75km", "100km","150km","200km"), cex.axis=0.7)
  axis(2, at=seq(0,1, 0.1))
  abline(h=c(0.5), lty=2, lwd=1)
  legend("bottomleft", legend=c("Origin, agrarian", "Origin, trading", "Origin, fishing",
                                "Destination, agrarian", "Destination, trading", "Destination, fishing"), 
         col=c("seagreen", "darkgoldenrod1", "dodgerblue2","seagreen", "darkgoldenrod1", "dodgerblue2"), 
         pch=c(1,2,0, 19,17,15), lty=1, bty="n")

# Figs 1C: Plot Female age specific probablity of being an inmigrant 
  
  ## Women in agrarian communities
    fem.femage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="F" 
                                                                                 & r16_census$comtype==0,])
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    plot(fem.femage.data$upper~fem.femage.data$ageyrs, type="l", lty=1, col="white", 
         xlab="Female age (years)", ylab="Probability of being a recent in-migrant at RCCS R16", ylim=c(0.0,0.6), xlim=c(16,48))
    r<-fem.femage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "palegreen3", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, lwd=2, col="seagreen", ylim=c(0.0,0.1))
    
  ## Women in trading communities
    fem.femage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="F" 
                                                                                 & r16_census$comtype==1,])
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    #plot(fem.femage.data$upper~fem.femage.data$ageyrs, type="l", lty=1, col="white", 
    #     xlab="Female age (years)", ylab="Probability of HPV concordance", ylim=c(0.0,0.51))
    r<-fem.femage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "lightgoldenrod1", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, col="darkgoldenrod1", ylim=c(0.0,0.1))
  
  ## Women in fishing communities
    fem.femage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="F" 
                                                                                 & r16_census$comtype==2,])
    myval<-seq(15,49, by=0.01)
    fem.femage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(fem.femage, newdata=fem.femage.data, type='response', se=T)
    fem.femage.data$fits = fits$fit
    fem.femage.data$se.fit=fits$se.fit
    fem.femage.data$upper<-fem.femage.data$fit + 1.96*fem.femage.data$se.fit
    fem.femage.data$lower<-fem.femage.data$fit - 1.96*fem.femage.data$se.fit
    #plot(fem.femage.data$upper~fem.femage.data$ageyrs, type="l", lty=1, col="white", 
    #     xlab="Female age (years)", ylab="Probability of HPV concordance", ylim=c(0.0,0.51))
    r<-fem.femage.data$ageyrs
    polygon(c(r, rev(r)), c(fem.femage.data$upper, rev(fem.femage.data$lower)),
            col = "lightblue2", border = NA)
    lines(fem.femage.data$fit~fem.femage.data$ageyrs, type="l", lty=1, col="dodgerblue2", ylim=c(0.0,0.1))
    
# Figs 1D: Plot Female age specific probablity of being an inmigrant 
    
  ## Men in agrarian communities
    man.manage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="M" 
                                                                                 & r16_census$comtype==0,])
    myval<-seq(15,49, by=0.01)
    man.manage.data  = as.data.frame(expand.grid(ageyrs=myval))
    fits = predict(man.manage, newdata=man.manage.data, type='response', se=T)
    man.manage.data$fits = fits$fit
    man.manage.data$se.fit=fits$se.fit
    man.manage.data$upper<-man.manage.data$fit + 1.96*man.manage.data$se.fit
    man.manage.data$lower<-man.manage.data$fit - 1.96*man.manage.data$se.fit
    plot(man.manage.data$upper~man.manage.data$ageyrs, type="l", lty=1, col="white", 
         xlab="manale age (years)", ylab="Probability of being a recent in-migrant at RCCS R16", ylim=c(0.0,0.6), xlim=c(16,48))
    r<-man.manage.data$ageyrs
    abline(h=c(0.1,0.2,0.3,0.4,0.5,0.6), col="gray70", lty=2)
    abline(v=c(15,20,25,30,35,40,45), col="gray70", lty=2)
    polygon(c(r, rev(r)), c(man.manage.data$upper, rev(man.manage.data$lower)),
            col = "palegreen3", border = NA)
    lines(man.manage.data$fit~man.manage.data$ageyrs, type="l", lty=1, lwd=2, col="seagreen", ylim=c(0.0,0.1))
    
  
  ## Menin trading communities
    man.manage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="M" 
                                                                                 & r16_census$comtype==1,])
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
    man.manage <- gam(inmigrant ~ s(ageyrs),family=binomial(link=log),data=r16_census[r16_census$sex=="M" 
                                                                                 & r16_census$comtype==2,])
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
    

    

    
