# This file reproduces Figure 4A in "Migration, hotspots, and dispersal of HIV infection in Rakai Uganda"

# Read in data 
  load("./data/MigrationNetwork_Figure4A_data.rda")

# Load relevant libraries
  library("igraph")  
  library("RColorBrewer")
  library("raster")

# Load relevant shape files
  uganda<-raster::getData('GADM',country="UGA",level=3)
  uganda2<-raster::getData('GADM',country="UGA",level=4)
  
# Create colors for the edges using the following colors 
  long= data.frame(prev = as.numeric(t(prevmat)), ew=as.numeric(t(mfreq)))
  long$prev[long$prev == Inf] = NA
  long$rowname<-rep(rownames(prevmat), times= ncol(prevmat))  
  long$colname<-rep(colnames(prevmat), each = ncol(prevmat))
  
  reds<-brewer.pal(9, "YlOrRd")
  reds<-reds[2:9]
  long$color = reds[cut(long$prev, breaks = c(-1, 0.05, 0.1, 0.15, 0.2, 0.25, 0.30, 0.35, 1))]
  long$color[is.na(long$color)] = "#FFFFFF"
  long<-long[which(long$rowname!=long$colname & long$ew!=0),]
  
# Create a graph object using the mfreq dataset
  net=graph.adjacency(t(mfreq),mode="directed",weighted=T, diag=F)

# Add colors to graph
  temp<-get.edgelist(net)
  id<-paste(temp[,1], temp[,2], sep=":")
  long$id<-paste(long$rowname, long$colname, sep=":")
  long<-long[match(id, long$id),]
  E(net)$color <- long$color

# Determine Vertex Size
  x1<-totevent
  x<-rep(NA, length(totevent))
  x[which(x1<=1000)]<-1
  x[which(x1>1000 & x1<=2000)]<-2
  x[which(x1>2000 & x1<=3000)]<-3
  x[which(x1>3000 & x1<=4000)]<-4
  x[which(x1>4000)]<-5
  x[which(names(x1)=="Kampala")]<-2
  x[which(names(x1)=="Masaka District")]<-2
  x[which(names(x1)=="Tanzania")]<-2
  V(net)$size=x

# Determine Vertex color
  x1<-subdis_hivprev
  mycol<-reds[cut(x1, breaks = c(-1, 0.05, 0.1, 0.15, 0.2, 0.25, .30, 0.35, 1))]
  names(mycol)<-names(x1)
  addme<-c("gray", "gray","gray")
  names(addme)<-c("Kampala", "Masaka District", "Tanzania")
  mycol<-c(mycol, addme)
  mycol<-mycol[order(names(mycol))]
  V(net)$color=mycol


# Determine Edge Weights
  myw<-E(net)$weight
  aweight<-myw
  aweight[myw<50]<-0.2
  aweight[myw>=50 & myw<=100]<-0.5
  aweight[myw>=100 & myw<=200]<-1
  aweight[myw>=200 & myw<=300]<-2
  aweight[myw>=300]<-3
  
# Plot migration network 
  plot(uganda[which(uganda$NAME_2=="Kakuuto" | uganda$NAME_2=="Kooki" | uganda$NAME_2=="Kyotera" |
                      uganda$NAME_3=="Kyanamukaaka"),],xlim=range(coords[,1]), 
       ylim=range(coords[,2]), col="gray90")
  plot(uganda2[which(uganda2$NAME_2=="Kabula"),], add=T, col="gray90")
  legend("bottomleft", legend=c("<5%", "5-10%","10-15%", "15-20%", "20-25%", "25-30%", "30-35%", ">35%", "Unknown"), pch=19, col=c(reds, "gray"))
  legend("bottom", c("<50", "50-100", "100-200", "200-500", ">500"), lwd=c(0.2,0.5, 1, 2,3)*5, col="black")
  legend("top", c("<1000", "1000-2000", "2000-3000", "3000-4000", ">4000"), pch=1,  col="black", pt.cex=c(1,2,3,4,5), cex=1)
  plot(net, layout=coords, add=TRUE, rescale=F, edge.width=aweight*5, vertex.size=V(net)$size*2.5,
       edge.arrow.size=1, edge.curved=TRUE)

  ## Note that final figure was aesthetically edited in Adobe Illustrator to improve clarity of legends/arrows on graph
  
  
  