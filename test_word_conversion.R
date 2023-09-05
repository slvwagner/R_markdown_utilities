library(officer)

document <- read_docx("test.docx")
str(document)

# creata a data frame from word document
df_doc <- officer::docx_summary(document)
df_doc

create_Rmd <- function(df_doc) {
  c_md <- ""
  first_paragraph <- TRUE
  for (ii in 1:nrow(df_doc)) {
    if(is.na(df_doc$style_name[ii])){
      if(first_paragraph)  {
        c_md[ii] <- df_doc$text[ii]|>paste0("  \\")
        first_paragraph <- FALSE
        }
      else {
        c_md[ii] <- df_doc$text[ii]|>paste0("  \\")
        }
    }
    else if (df_doc$style_name[ii] == "Title"){
      first_paragraph <- T
      c_md[ii] <- paste0("---\ntitle: ","\"",df_doc$text[ii],
                            "\"\nauthor: \"",document$doc_properties$data["creator","value"],
                            "\"\ndate: \"",Sys.Date(),"\"\noutput:\n    html_document: default\n    word_document: default\n    pdf_document: default\n---")
    }
    else if (df_doc$style_name[ii] == "heading 1"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n# ",df_doc$text[ii])
    }
    else if (df_doc$style_name[ii] == "heading 2"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n## ",df_doc$text[ii])
    }
    else if (df_doc$style_name[ii] == "heading 3"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n### ",df_doc$text[ii])
    }
    else if (df_doc$style_name[ii] == "heading 4"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n#### ",df_doc$text[ii])
    }
    else if (df_doc$style_name[ii] == "heading 5"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n##### ",df_doc$text[ii])
    }
  }
  return(c_md)
}

microbenchmark::microbenchmark(create_Rmd(df_doc), times = 100)

c_filename <- "test_" # word document file name with no file extension 

create_Rmd(df_doc)|>
  write(paste0(c_filename,".Rmd"))

rmarkdown::render(paste0(c_filename,".Rmd"), 
                  c("html_document", "pdf_document","word_document"))

browseURL(paste0(c_filename,".html"))

# ############################################################################
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
