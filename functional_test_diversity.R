library(dplyr)
library(easystats)

functional.test.diversity <- function(data,q=0)
{
  type <- c(rep(factor("KO"),5*20),rep(factor("WT"),6*20))
  type0 <- c(rep(factor("KO"),5),rep(factor("WT"),6))
  fileConn <- file(sprintf("report_functional_%s_%d.md",deparse(substitute(data)),q))
  
  filter(data$iNextEst$size_based,Order.q==q,Method=="Extrapolation") %>% group_by(Assemblage) %>% 
      select(qD)  -> aux
  filename <- sprintf("report_functional_%s_%d_extrapolated.md",deparse(substitute(data)),q)
  cat("\n",sprintf("\n# %d-diversity index for %s (extrapolated)\n",q,deparse(substitute(data))), sep = "\n", file = filename)
  
  group_by(aux,Assemblage) %>% summarize(max=max(qD)) -> aux0
  print("####################")
  print(aux0)
  aux0$Assemblage <- type0
  aux$Assemblage <- type
  
  group_by(aux0,Assemblage) %>% summarise(mean=mean(max),se=standard_error(max)) -> values
  cat("### Mean and standard error\n",sep = "\n", file = filename, append = TRUE)
  cat(sprintf("KO: %.0f +- %.0f\n",values$mean[1],values$se[1]),sep = "\n", file = filename, append = TRUE)
  cat(sprintf("WT: %.0f +- %.0f\n",values$mean[2],values$se[2]),sep = "\n", file = filename, append = TRUE)
  
  htest <- with(aux,wilcox.test(qD~Assemblage))
  cat("### Statistical test (non-parametric)\n", sep = "\n", file = filename, append = TRUE)
  cat(sprintf("Mann-Whitney test:\n\n %s: mean %d-diversity by type (KO vs WT)\n",deparse(substitute(data)),q), sep = "\n", file = filename, append = TRUE)
  cat(sprintf("W=%d, p-value = %f\nalternative hypothesis: true location shift is not equal to 0\n\n",htest$statistic,htest$p.value), sep = "\n", file = filename, append = TRUE)
}

TRA_cdr3_div <- readRDS("TRA_cdr3_div.rda")
functional.test.diversity(TRA_cdr3_div,q=0)
functional.test.diversity(TRA_cdr3_div,q=1)
functional.test.diversity(TRA_cdr3_div,q=2)

TRA_cdr3_div_filtered <- readRDS("TRA_cdr3_div_filtered.rda")
functional.test.diversity(TRA_cdr3_div_filtered,q=0)
functional.test.diversity(TRA_cdr3_div_filtered,q=1)
functional.test.diversity(TRA_cdr3_div_filtered,q=2)

TRB_cdr3_div <- readRDS("TRB_cdr3_div.rda")
functional.test.diversity(TRB_cdr3_div,q=0)
functional.test.diversity(TRB_cdr3_div,q=1)
functional.test.diversity(TRB_cdr3_div,q=2)

TRB_cdr3_div_filtered <- readRDS("TRB_cdr3_div_filtered.rda")
functional.test.diversity(TRB_cdr3_div_filtered,q=0)
functional.test.diversity(TRB_cdr3_div_filtered,q=1)
functional.test.diversity(TRB_cdr3_div_filtered,q=2)
