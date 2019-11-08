#Load relevant libraries
library("gplots")

# Load data 


par(mfrow=c(1,1))
barplot2(t(-fembar), col=c("darkorange2", "darkorange4", "dodgerblue1", "dodgerblue4"), beside=T, plot.ci=T, ci.l=t(-fembar.low),
         ci.u=t(-fembar.high), 
         ylab="Place of Origin", xlab="HIV prevalence among in-migrants", xlim=c(-1, 1), 
         main="Women", horiz=T, axes=FALSE)
legend("bottomright", legend=c("Agrarian/Trading, in-migrants", "Fishing, in-migrants", 
                               "Agrarian/Trading, out-migrants", "Fishing, out-migrants"), 
       pch=15, pt.cex=2, col=c("darkorange2", "dodgerblue1", "darkorange4", "dodgerblue4"), bty="n")

barplot2(t(manbar), col=c("darkorange2",  "darkorange4", "dodgerblue1","dodgerblue4"), beside=T, plot.ci=T, ci.l=t(manbar.low), 
         ci.u=t(manbar.high), 
         horiz=T, add=T, axes=F)
abline(v=seq(-1,1, 0.1), lty=2, col="gray80")
abline(v=0, lwd=2)
axis(1, seq(-1,1,0.1), labels=abs(seq(-1,1,0.1)))
box()
