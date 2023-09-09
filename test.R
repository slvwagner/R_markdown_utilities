
rm(list = ls())
#source("tabel of contents for Markdown file.R")
library(slvwagner)

##########################################################################
c_FileName <- "test"
c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()

# ##########################################################################
# c_FileName <- "Moving-Head-Tracking-12"
# c_Rmd <- paste0("G:/Meine Ablage/50_Informatik/100_R/010_Private Projekte/Moving-Head-Tracking/",c_FileName, ".Rmd")|>
#   readLines()|>
#   suppressWarnings()


#############################################################
cnt <- 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = FALSE , nb_front = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = TRUE , nb_front = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = FALSE, create_top_link = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = FALSE, create_top_link = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = TRUE , nb_front = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = FALSE , nb_front = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))

browseURL(paste0("output/00",cnt,".Rmd"))

# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/00",cnt,".html"))