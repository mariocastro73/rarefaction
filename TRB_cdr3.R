library(iNEXT)
source('split_string.R')
path_data <- 'TRB_cdr3_analysis'

if (file.exists("TRB_cdr3_div.rda")) {
  print("Reading file...")
  TRB_cdr3_div <- readRDS("TRB_cdr3_div.rda")
  TRB_cdr3_div_se <- readRDS("TRB_cdr3_div_se.rda")
  TRB_cdr3_div_aggr <- readRDS("TRB_cdr3_div_aggr.rda")
  # TRB_cdr3_div_aggr_se <- readRDS("TRB_cdr3_div_aggr_se.rda")
  print("...done")
} else {
  ff <- list.files(path_data, recursive = F, full.names = TRUE )
  samples <- split_vector_of_strings(ff)
  
  counts <- lapply(ff, function(x) {read.table(x, header = TRUE, sep = "\t", as.is=T )}) #as.is drops factors
  
  counts <- list()
  for(i in 1:length(ff)) {
    counts[[i]] <- read.table(ff[i],header=TRUE)$count
  }
  names(counts) <- samples
  TRB_cdr3_div <- iNEXT(counts, q=c(0,1,2), datatype="abundance",se=FALSE)
  # TRB_cdr3_div_se <- iNEXT(counts, q=c(0,1,2), datatype="abundance")
  saveRDS(TRB_cdr3_div,"TRB_cdr3_div.rda")
  # saveRDS(TRB_cdr3_div,"TRB_cdr3_div_se.rda")
  counts2 <- list()
  aux <- c()
  for(i in 1:5) {
    aux <- c(aux,counts[[i]])
  }
  counts2$KO <- aux
  aux <- c()
  for(i in 6:11) {
    aux <- c(aux,counts[[i]])
  }
  counts2$WT <- aux
  TRB_cdr3_div_aggr <- iNEXT(counts2, q=c(0,1,2), datatype="abundance",se=FALSE)
  saveRDS(TRB_cdr3_div_aggr,"TRB_cdr3_div_aggr.rda")
  # TRB_cdr3_div_aggr_se <- iNEXT(counts2, q=c(0,1,2), datatype="abundance")
  # saveRDS(TRB_cdr3_div_aggr_se,"TRB_cdr3_div_aggr.rda")
  
}

x11("",9,4)
par(mfrow=c(1,3))
plot(TRB_cdr3_div,col=c(rep(1,5),rep(2,6)))
dev.copy2pdf(file='TRB_cdr3_diversities.pdf')
x11("",9,4)
par(mfrow=c(1,3))
plot(TRB_cdr3_div_se,col=c(rep(1,5),rep(2,6)))
dev.copy2pdf(file='TRB_cdr3_diversities_se.pdf')
x11("",9,4)
par(mfrow=c(1,3))
plot(TRB_cdr3_div_aggr,col=c(1,2))
dev.copy2pdf(file='TRB_cdr3_diversities_aggregated.pdf')

#################################################################################
#################################################################################
#################################################################################
#################################################################################
ggiNEXT(TRB_cdr3_div_aggr, facet.var="Order.q")
ggiNEXT(TRB_cdr3_div_aggr, facet.var="Assemblage")
ggiNEXT(TRB_cdr3_div_aggr, color.var="Assemblage", facet.var="Order.q")

#####
ggiNEXT(TRB_cdr3_div, facet.var="Assemblage")
ggiNEXT(TRB_cdr3_div, color.var="Assemblage",type=1)
ggiNEXT(TRB_cdr3_div, color.var="Assemblage", facet.var="Order.q",type=2)
ggiNEXT(TRB_cdr3_div, color.var="Assemblage", facet.var="Order.q",type=3)



ggiNEXT(TRB_cdr3_div, facet.var="Assemblage",type=2)
ggiNEXT(TRB_cdr3_div, facet.var="Assemblage", color.var="Order.q")
ggiNEXT(TRB_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=1)
ggiNEXT(TRB_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=2)
ggiNEXT(TRB_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=3)
ggiNEXT(TRB_cdr3_div, facet.var="Both", color.var="Both")
