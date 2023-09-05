library(rebus)
library(stringr)

c_FileName <- "test"
c_Rmd <- slvwagner::r_tbl_contents(paste0("input/",c_FileName, ".Rmd"))
c_Rmd

# write created markdown file  
c_Rmd|>
  write(paste0("output/",c_FileName, ".Rmd"))

# write created markdown file  
c_Rmd|>
  write(paste0("output/",c_FileName, ".Rmd"))

# render html file 
rmarkdown::render(paste0("output/",c_FileName,".Rmd"), 
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/",c_FileName,".html"))
