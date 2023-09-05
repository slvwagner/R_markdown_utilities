library(rebus)
library(stringr)

r_tbl_contents <- function(FileName) {
  
  # read markdown file
  c_Rmd <- suppressWarnings(readLines(FileName))
  c_Rmd

  # regex search pattern
  p <- "^#"

  # find structure
  c_struct <- c_Rmd[stringr::str_detect(c_Rmd, p)]
  c_struct
  
  # table of contents 
  tbl_contents <- c_struct|>stringr::str_remove_all("#")|>stringr::str_split("<", simplify = T)|>str_trim()
  # create links
  tbl_contents <- paste0("[",tbl_contents,"]","(#",tbl_contents,")")
  
  # search string
  c_detect <- c("^#\\s",
                "^##\\s",
                "^###\\s",
                "^####\\s",
                "^#####\\s",
                "^######\\s"
                )
  
  # Structure string
  c_add <- c("* ", 
             "    + ",
             "        + ",
             "            + ",
             "                + ",
             "                    + "
  )
  
  # create table of contents
  # first_heading <- TRUE
  for (ii in 1:length(tbl_contents)) {
    if(str_detect(c_struct[ii],c_detect[1]) ){
      tbl_contents[ii] <- paste0(c_add[1],tbl_contents[ii])
      # first_heading <- FALSE
    }
    else if(str_detect(c_struct[ii],c_detect[2])){
      tbl_contents[ii] <- paste0(c_add[2],tbl_contents[ii])
    }
    else if(str_detect(c_struct[ii],c_detect[3])){
      tbl_contents[ii] <- paste0(c_add[3],tbl_contents[ii])
    }
    else if(str_detect(c_struct[ii],c_detect[4])){
      tbl_contents[ii] <- paste0(c_add[4],tbl_contents[ii])
    }
    else if(str_detect(c_struct[ii],c_detect[5])){
      tbl_contents[ii] <- paste0(c_add[5],tbl_contents[ii])
    }
    else if(str_detect(c_struct[ii],c_detect[6])){
      tbl_contents[ii] <- paste0(c_add[6],tbl_contents[ii])
    }
  }
  for (ii in tbl_contents) cat(paste0("\n",ii))
  
  # creat links
  
  # put anchor to all headings
  c_Rmd <- ifelse(stringr::str_detect(c_Rmd, p), paste0(c_Rmd, "<a name=\"",c_Rmd|>stringr::str_remove_all("#")|>stringr::str_trim(),"\"></a>"), c_Rmd)
  c_Rmd
  
  # find position to insert table of contents
  for(ii in 1:length(c_Rmd)){
    if(stringr::str_detect(c_Rmd[ii],p)) {
      c_start <- ii
      break
    }
  }
  
  # insert table off contents
  c_Rmd <- c(c_Rmd[1:(c_start-1)],
             "\n# Tabel of Content",
             tbl_contents, "\n",
             c_Rmd[c_start:length(c_Rmd)])
  return(c_Rmd)
}


c_FileName <- "test"
c_Rmd <- r_tbl_contents(paste0("input/",c_FileName, ".Rmd"))
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
