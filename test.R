source("tabel of contents for Markdown file.R")

c_FileName <- "test"

c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()
c_Rmd


r_tbl_contents(c_Rmd)|>
  write("output/001.Rmd")

r_tbl_contents(c_Rmd, T)|>
  write("output/002.Rmd")


# render html file 
rmarkdown::render(paste0("output/001.Rmd"), 
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/001.html"))

# render html file 
rmarkdown::render(paste0("output/002.Rmd"), 
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/002.html"))