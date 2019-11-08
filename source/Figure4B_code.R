# This file reproduces Figure 4B in "Migration, hotspots, and dispersal of HIV infection in Rakai Uganda"

# Read in data 
load("./data/MigrationNetwork_Figure4B_data.rda")

plot(community_HIVprevalenceData$prev16.inmigrant~community_HIVprevalenceData$prev16.resident, ylim=c(0.05,0.50), xlim=c(0.05,0.50), pch=21, bg="seagreen", 
     ylab=c("HIV prevalence, In-migrants"), xlab=c("HIV prevalence, Resident Population"), cex=2)
points(community_HIVprevalenceData$prev16.inmigrant[community_HIVprevalenceData$comtype==1]~community_HIVprevalenceData$prev16.resident[community_HIVprevalenceData$comtype==1], 
       pch=21, cex=2, bg="goldenrod1")
points(community_HIVprevalenceData$prev16.inmigrant[community_HIVprevalenceData$comtype==2]~community_HIVprevalenceData$prev16.resident[community_HIVprevalenceData$comtype==2],
       pch=21, cex=2, bg="dodgerblue1")
x<-community_HIVprevalenceData$prev16.resident
y<-community_HIVprevalenceData$prev16.inmigrant
mylm<-lm(y~x)
fit2<-lm(prev16.inmigrant~prev16.resident, data=community_HIVprevalenceData[community_HIVprevalenceData$comtype!=2,])
legend("topleft", legend=c("Agrarian community", "Trading community", "Fish landing site"), 
       col=c("seagreen", "darkgoldenrod1", "dodgerblue2"), cex=1.3, pch=19, bty="n")
abline(mylm, col="red", lwd=2)
abline(a=0,b=1,lty=2)
dev.copy2pdf(file="SuppFig_residentVs.InmigrantHIVPrev Community.pdf", useDingbats=F)