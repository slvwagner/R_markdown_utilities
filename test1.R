rm(list = ls())

#source("tabel of contents for Markdown file.R")
#library(slvwagner)

##########################################################################
c_FileName <- "test"
c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()

# ##########################################################################
# c_FileName <- "Machbarkeit grosse schwere Komponenten"
# c_Rmd <- paste0("G:/Meine Ablage/50_Informatik/100_R/001_Kunden/Essemtec/001_Projekte/Machbarkeit grosse schwere Komponenten/Kopfabhängigkeiten/",c_FileName, ".Rmd")|>
#   readLines()|>
#   suppressWarnings()

# ##########################################################################
# c_FileName <- "Moving-Head-Tracking-12"
# c_Rmd <- paste0("G:/Meine Ablage/50_Informatik/100_R/010_Private Projekte/Moving-Head-Tracking/",c_FileName, ".Rmd")|>
#   readLines()|>
#   suppressWarnings()




#############################################################################
create_nb = TRUE
create_top_link = TRUE
nb_front = TRUE
set_first_heading_level = TRUE

dir.create("output/")|>suppressWarnings()

#############################################################
cnt <- 0
#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, toc_heading_string = "Inhaltsverzeichnis",create_nb = TRUE, create_top_link = TRUE , nb_front = TRUE, pagebreak_level = "1")|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, create_nb = TRUE, create_top_link = TRUE , nb_front = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))






#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, toc_heading_string = "Inhaltsverzeichnis",create_nb = FALSE, create_top_link = FALSE)|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, toc_heading_string = "Inhaltsverzeichnis",create_nb = FALSE, create_top_link = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))







#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, toc_heading_string = "Inhaltsverzeichnis",create_nb = TRUE, create_top_link = FALSE , nb_front = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))

#############################################################
cnt <- cnt + 1
r_toc_for_Rmd(c_Rmd, toc_heading_string = "Inhaltsverzeichnis",create_nb = TRUE, create_top_link = TRUE , nb_front = TRUE)|>
  write(paste0("output/00",cnt,".Rmd"))
# show .Rmd file
# browseURL(paste0("output/00",cnt,".Rmd"))
# render html file
rmarkdown::render(paste0("output/00",cnt,".Rmd"),
                  c("html_document"))
# show html in web browser
browseURL(paste0("output/00",cnt,".html"))