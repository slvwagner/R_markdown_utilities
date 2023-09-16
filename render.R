#if(!require(slvwagner))devtools::install_git("https://github.com/wagnius-GmbH/slvwagner/")


# Render Rmd files to html, word and pdf

################################################################################################################
# html documents
rm(list = ls())
c_FileName <- list.files()
c_FileName <- c_FileName[c_FileName|>stringr::str_detect(".Rmd$") & !c_FileName|>stringr::str_detect("_.Rmd")]|>stringr::str_remove(".Rmd$") 
c_FileName
c_FileExtention <- ".Rmd"

dir.create("output/")|>suppressWarnings()

c_file <-  paste0(c_FileName|>stringr::str_replace_all(" ","_"))
c_file

c_Rmd <- paste0(getwd(),"/",c_file,"_",c_FileExtention)
c_Rmd

ii <- 1
for (ii in 1:length(c_FileName)) {
  # create Rmd files
  paste0(c_FileName[ii],c_FileExtention)|>
    readLines()|>
    r_toc_for_Rmd(toc_heading_string = "Inhaltsverzeichnis")|>
    writeLines(c_Rmd[ii])
}
for (ii in 1:length(c_FileName)) {
  # render files
  try(rmarkdown::render(c_Rmd[ii],
                        c("html_document"),
                        output_dir = paste0(getwd(),"/output"))
  )
}

rm(list = ls())
c_FileName <- list.files()
c_FileName

c_FileName <- c_FileName[c_FileName|>stringr::str_detect("_.Rmd")]
c_FileName

ii <- 1
for (ii in 1:length(c_FileName)) {
  file.remove(c_FileName[ii])
}

################################################################################################################
# word and PDF
rm(list = ls())
c_FileName <- list.files()
c_FileName <- c_FileName[c_FileName|>stringr::str_detect(".Rmd$") & !c_FileName|>stringr::str_detect("_.Rmd")]|>stringr::str_remove(".Rmd$") 
c_FileName
c_FileExtention <- ".Rmd"

dir.create("output/")|>suppressWarnings()

c_file <-  paste0(c_FileName|>stringr::str_replace_all(" ","_"))
c_file

c_Rmd <- paste0(getwd(),"/",c_file,"_",c_FileExtention)
c_Rmd

for (ii in 1:length(c_FileName)) {
  # create Rmd files
  paste0(c_FileName[ii],c_FileExtention)|>
    readLines()|>
    r_toc_for_Rmd(toc_heading_string = "Inhaltsverzeichnis", pagebreak_level = "1", create_top_link = FALSE)|>
    writeLines(c_Rmd[ii])
}
for (ii in 1:length(c_FileName)) {
  # render files
  try(rmarkdown::render(c_Rmd[ii],
                        c("word_document"),
                        output_dir = paste0(getwd(),"/output"))
  )
}
for (ii in 1:length(c_FileName)) {
  # render files
  try(rmarkdown::render(c_Rmd[ii],
                        c("pdf_document"),
                        output_dir = paste0(getwd(),"/output"))
  )
}

rm(list = ls())
c_FileName <- list.files()
c_FileName

c_FileName <- c_FileName[c_FileName|>stringr::str_detect("_.Rmd")]
c_FileName

ii <- 1
for (ii in 1:length(c_FileName)) {
  file.remove(c_FileName[ii])
}


rm(list = ls())