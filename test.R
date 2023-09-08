
rm(list = ls())
source("tabel of contents for Markdown file.R")

##########################################################################
c_FileName <- "test"

c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()
c_Rmd[1:20]





#############################################################
cnt <- 1
r_toc_for_Rmd(c_Rmd, T, T)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, T, F)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, F, T)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))
 
# # #############################################################
# cnt <- cnt + 1
# r_toc_for_Rmd(c_Rmd, F, F)|>
#   write(paste0("output/00",cnt,".Rmd"))
# 
# browseURL(paste0("output/00",cnt,".Rmd"))
# 
# # render html file
# rmarkdown::render(paste0("output/00",cnt,".Rmd"),
#                   c("html_document"))
# 
# # show html in web browser
# browseURL(paste0("output/00",cnt,".html"))