library(rebus)
library(stringr)

contents_tbl <- function(FileName) {
  # read markdown file 
  c_Rmd <- suppressWarnings(readLines(FileName))
  c_Rmd
  
  # regex search pattern 
  p <- c(START%R%"#")
  
  # find positon to insert tabel of contents
  for(ii in 1:length(c_Rmd)){
    if(str_detect(c_Rmd[ii],p)) {
      c_start <- ii
      break
      }
  }
  
  # Headings to find
  heading <- c_Rmd[str_detect(c_Rmd, p)]|>str_remove_all("#")|>str_split("<", simplify = T)
  heading <- heading[,1]|>str_trim()
  
  # put anchor to headings 
  c_Rmd <- ifelse(str_detect(c_Rmd, p), paste0(c_Rmd, "<a name=\"",c_Rmd|>str_remove_all("#")|>str_trim(),"\"></a>"), c_Rmd)
  c_Rmd

  # create table on contents
  c_Rmd <- c(c_Rmd[1:(c_start-1)],
            "\n# Tabel of Content",
            paste0("[",heading,"]","(#",heading,")","  \\"), "\n", # insert table of contents
            c_Rmd[c_start:length(c_Rmd)])
  return(c_Rmd)
}

c_FileName <- "test"
c_Rmd <- contents_tbl(paste0("input/",c_FileName, ".Rmd"))
c_Rmd

# write created markdown file  
c_Rmd|>
  write(paste0("output/",c_FileName, ".Rmd"))

# render html file 
rmarkdown::render(paste0("output/",c_FileName,".Rmd"), 
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/",c_FileName,".html"))
