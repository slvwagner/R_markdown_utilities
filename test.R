
rm(list = ls())
source("tabel of contents for Markdown file.R")
#library(slvwagner)

##########################################################################
c_FileName <- "test"
c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()


#############################################################
cnt <- 0
#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = FALSE , nb_front = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document", "pdf_document"))

