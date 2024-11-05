path_data <- 'TRA_cdr3_analysis'

if (file.exists("TRA_cdr3_div.rda")) {
  print("Reading file...")
  TRA_cdr3_div <- readRDS("TRA_cdr3_div.rda")
  TRA_cdr3_div_aggr <- readRDS("TRA_cdr3_div_aggr.rda")
  TRA_cdr3_div_aggr <- readRDS("TRA_cdr3_div_aggr.rda")
  TRA_cdr3_div_se <- readRDS("TRA_cdr3_div_se.rda")
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
  TRA_cdr3_div <- iNEXT(counts, q=c(0,1,2), datatype="abundance",se=FALSE)
  saveRDS(TRA_cdr3_div,"TRA_cdr3_div.rda")
  TRA_cdr3_div_se <- iNEXT(counts, q=c(0,1,2), datatype="abundance")
  saveRDS(TRA_cdr3_div_se,"TRA_cdr3_div_se.rda")
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
  TRA_cdr3_div_aggr <- iNEXT(counts2, q=c(0,1,2), datatype="abundance",se=FALSE)
  saveRDS(TRA_cdr3_div_aggr,"TRA_cdr3_div_aggr.rda")
}

x11("",9,4)
par(mfrow=c(1,3))
plot(TRA_cdr3_div,col=c(rep(1,5),rep(2,6)))
dev.copy2pdf(file='TRA_cdr3_diversities.pdf')
x11("",9,4)
par(mfrow=c(1,3))
plot(TRA_cdr3_div_se,col=c(rep(1,5),rep(2,6)))
dev.copy2pdf(file='TRA_cdr3_diversities_se.pdf')
x11("",9,4)
par(mfrow=c(1,3))
plot(TRA_cdr3_div_aggr,col=c(1,2))
dev.copy2pdf(file='TRA_cdr3_diversities_aggregated.pdf')

#################################################################################
# Same with ggplotting                                                          #
# (Uncomment if you like these)                                                 #
#################################################################################
# ggiNEXT(TRA_cdr3_div_aggr, facet.var="Order.q")
# ggiNEXT(TRA_cdr3_div_aggr, facet.var="Assemblage")
# ggiNEXT(TRA_cdr3_div_aggr, color.var="Assemblage", facet.var="Order.q")
# 
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage")
# ggiNEXT(TRA_cdr3_div, color.var="Assemblage",type=1)
# ggiNEXT(TRA_cdr3_div, color.var="Assemblage", facet.var="Order.q",type=2)
# ggiNEXT(TRA_cdr3_div, color.var="Assemblage", facet.var="Order.q",type=3)
# 
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage",type=2)
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage", color.var="Order.q")
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=1)
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=2)
# ggiNEXT(TRA_cdr3_div, facet.var="Assemblage", color.var="Order.q",type=3)
