Open `rarefactionTCR.Rproj` or run directly `main.R`

If you want to run all the analysis from scratch, remove all the `*.rda` files (or better, move them elsewhere).

Output:
- PDFs with the rarefaction-extrapolation curves.
- Statistical reports in Markdown format (use pandoc, https://cran.r-project.org/web/packages/pandoc/index.html) to convert them to Word or any other popular format.

```R
> sessionInfo()
R version 4.4.2 (2024-10-31)
Platform: x86_64-pc-linux-gnu
Running under: ArcoLinux

Matrix products: default
BLAS:   /usr/lib/libblas.so.3.12.0 
LAPACK: /usr/lib/liblapack.so.3.12.0

locale:
 [1] LC_CTYPE=es_ES.UTF-8       LC_NUMERIC=C               LC_TIME=es_ES.UTF-8       
 [4] LC_COLLATE=es_ES.UTF-8     LC_MONETARY=es_ES.UTF-8    LC_MESSAGES=es_ES.UTF-8   
 [7] LC_PAPER=es_ES.UTF-8       LC_NAME=C                  LC_ADDRESS=C              
[10] LC_TELEPHONE=C             LC_MEASUREMENT=es_ES.UTF-8 LC_IDENTIFICATION=C       

time zone: Europe/Madrid
tzcode source: system (glibc)

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] see_0.9.0          report_0.5.9       parameters_0.22.2  performance_0.12.3 modelbased_0.8.9  
 [6] insight_0.20.5     effectsize_0.8.9   datawizard_0.13.0  correlation_0.8.6  bayestestR_0.15.0 
[11] easystats_0.7.3    dplyr_1.1.4        iNEXT_3.0.1       

loaded via a namespace (and not attached):
 [1] gtable_0.3.5       compiler_4.4.2     tidyselect_1.2.1   Rcpp_1.0.13-1      stringr_1.5.1     
 [6] scales_1.3.0       lattice_0.22-6     coda_0.19-4.1      ggplot2_3.5.1      R6_2.5.1          
[11] plyr_1.8.9         generics_0.1.3     tibble_3.2.1       munsell_0.5.1      pillar_1.9.0      
[16] rlang_1.1.4        utf8_1.2.4         stringi_1.8.4      estimability_1.5.1 cli_3.6.3         
[21] withr_3.0.2        magrittr_2.0.3     emmeans_1.10.4     grid_4.4.2         xtable_1.8-4      
[26] rstudioapi_0.17.1  mvtnorm_1.3-0      lifecycle_1.0.4    vctrs_0.6.5        glue_1.8.0        
[31] fansi_1.0.6        colorspace_2.1-0   reshape2_1.4.4     tools_4.4.2        pkgconfig_2.0.3   
```
