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


rmarkdown::render(paste0("output/",c_filename,".Rmd"), 
                  c("pdf_document","word_document"))

# ############################################################################
# microbenchmark::microbenchmark(create_Rmd(df_doc), times = 100)

# 
# pinst <- plot_instr({
#   z <- c(rnorm(100), rnorm(50, mean = 5))
#   plot(density(z))
# })
# 
# body_add_plot()
# doc_1 <- cursor_reach(document, "Heading 1")|> # search for the Heading 1
#   cursor_forward() # move cursor down 
#   
# docx_show_chunk(doc_1) # show text of Heading 1
# 
# doc_1 <- body_replace_all_text(doc_1, old_value = "H",
#                       new_value = "new", only_at_cursor = TRUE, fixed = TRUE)
# docx_summary(doc_1)
# 
# doc_1 <- cursor_reach(doc_1, "Heading 2")|> # search for the Heading 1
#   cursor_forward() # move cursor down 
# 
# 
# body_add_plot(document1,pinst)
# 
# docx_show_chunk(document1) # show the new text
# 
# docx_file_1 <- print(document, target = tempfile(fileext = ".docx"))
