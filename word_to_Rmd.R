library(officer)

# load file
c_filename <- "test" # word document file name with no file extension 
document <- read_docx(paste0("input/",c_filename,".docx"))
# str(document)

# creata a data frame from word document
df_doc <- officer::docx_summary(document)
# df_doc

# create Rmarkdown file from word document
source("word_to_Rmarkdown_function.R")
c_Rmd <- create_Rmd(df_doc, T)

# write created markdown file  
c_Rmd|>
  write(paste0("output/",c_filename,".Rmd"))

# render html file 
rmarkdown::render(paste0("output/",c_filename,".Rmd"), 
                  c("html_document"))

# show html in web browser
browseURL(paste0("output/",c_filename,".html"))

# render all other stuff
rmarkdown::render(paste0("output/",c_filename,".Rmd"), 
                  c("pdf_document","word_document"))

