library(rebus)
library(stringr)

contents_tbl <- function(Rmd_doc) {
  # read markdown file 
  c_Rmd <- readLines("input/test.Rmd")
  c_Rmd
  # regex search pattern 
  p <- c(START%R%"#")
  
  # put ancor to headings 
  c_Rmd <- ifelse(str_detect(c_Rmd, p), paste0(c_Rmd, "<a name=\"",c_Rmd,"\"></a>"), c_Rmd)
  c_Rmd
  
  heading <- c_Rmd[str_detect(c_Rmd, p)]|>str_remove_all("#")|>str_split("<", simplify = T)
  heading <- heading[,1]|>str_trim()
  paste0("[",heading,"]","(#",heading,")")
  return(c_md)
}
