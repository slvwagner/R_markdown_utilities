create_Rmd <- function(df_doc, tc = TRUE) {
  c_table_of_content <- list()
  c_md <- ""
  first_paragraph <- TRUE
  cnt <- 1
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
      c_md[ii] <- paste0("\n# ",df_doc$text[ii],"<a name=\"",df_doc$text[ii],"\"></a>")
      first_paragraph <- T
      c_table_of_content[[cnt]] <- paste0("\n","[",df_doc$text[ii],"]","(#",df_doc$text[ii],")")
      cnt <- cnt + 1
    }
    else if (df_doc$style_name[ii] == "heading 2"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n## ",df_doc$text[ii],"<a name=\"",df_doc$text[ii],"\"></a>")
      c_table_of_content[[cnt]] <- paste0("\n","[",df_doc$text[ii],"]","(#",df_doc$text[ii],")")
      cnt <- cnt + 1
    }
    else if (df_doc$style_name[ii] == "heading 3"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n### ",df_doc$text[ii],"<a name=\"",df_doc$text[ii],"\"></a>")
      c_table_of_content[[cnt]] <- paste0("\n","[",df_doc$text[ii],"]","(#",df_doc$text[ii],")")
      cnt <- cnt + 1
    }
    else if (df_doc$style_name[ii] == "heading 4"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n#### ",df_doc$text[ii],"<a name=\"",df_doc$text[ii],"\"></a>")
      c_table_of_content[[cnt]] <- paste0("\n","[",df_doc$text[ii],"]","(#",df_doc$text[ii],")")
      cnt <- cnt + 1
    }
    else if (df_doc$style_name[ii] == "heading 5"){
      first_paragraph <- T
      c_md[ii] <- paste0("\n##### ",df_doc$text[ii],"<a name=\"",df_doc$text[ii],"\"></a>")
      c_table_of_content[[cnt]] <- paste0("\n","[",df_doc$text[ii],"]","(#",df_doc$text[ii],")")
      cnt <- cnt + 1
    }
  }
  if(tc){
    c_md <- c(c_md[1],
            "# Tabel of Content",
            c_table_of_content|>unlist()|>paste0(collapse = "  \\"),
            c_md[2:length(c_md)])
  }
  return(c_md)
}
