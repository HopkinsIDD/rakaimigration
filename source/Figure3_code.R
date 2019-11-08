# Load data
  load("./data/MigrationNetwork_Figure3_data.rda")

# Figure 3A - Sources of New HIV diagnoses in RCCS 
  barplot(newcase_table, beside=T,  col=c("deeppink3", "deepskyblue3"), main="Individuals with newly identified HIV-infection in RCCS communities",
          ylim=c(0,550), names=c("Incident cases", "In-migrants", "New recruits"), ylab="Frequency")
  abline(h=seq(0,500,50), lty=2, col="gray80")
  abline(h=0)
  px<-prop.table(newcase_table)
  text(1.5, newcase_table[1,1]+10, paste(round(px[1,1]*100,0), "%", sep="")) 
  text(2.5, newcase_table[2,1]+10, paste(round(px[2,1]*100,0), "%", sep=""))  
  text(4.5, newcase_table[1,2]+10, paste(round(px[1,2]*100,0), "%", sep=""))  
  text(5.5, newcase_table[2,2]+10, paste(round(px[2,2]*100,0), "%", sep=""))  
  text(7.5, newcase_table[1,3]+10, paste(round(px[1,3]*100,0), "%", sep=""))  
  text(8.5, newcase_table[2,3]+10, paste(round(px[2,3]*100,0), "%", sep=""))  
  
# Please note that data for Figure 3B could not be provided because it was individual-level
# HIV status information linked to geo-location and sharing was not IRB compliant 

# Figure 3C - Source locations of Migrants and HIV prevalence
  perc<-paste(round(prop.table(sourcecase_table,2)[1,],2)*100, "%", sep="")
  tabsum<-sourcecase_table[1,]+12 ## Use this for plotting
  
  barplot(sourcecase_table, col="white", ylim=c(0,425),
          main="Number and location of RCCS in-migrants originating outside Rakai and their HIV prevalence", ylab="Frequency")
  abline(h=seq(0,400,25), lty=2, col="gray80")
  barplot(sourcecase_table, col=c("tomato", "deepskyblue3"), add=T)
  abline(h=0)  
  legend("topright", legend=c( "HIV-positive","HIV-negative"),
         col=c("tomato", "deepskyblue3"), pch=15, bty="n", cex=1.5)
  text(0.7, tabsum[1], perc[1])
  text(2, tabsum[2], perc[2])
  text(3.1, tabsum[3], perc[3])
  text(4.3, tabsum[4], perc[4])
  text(5.5, tabsum[5], perc[5])
  text(6.7, tabsum[6], perc[6])
  text(7.9, tabsum[7], perc[7])
  text(10.3, tabsum[9], perc[9])
  