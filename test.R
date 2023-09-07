##########################################################################
c_FileName <- "Moving-Head-Tracking-12"

c_Rmd <- paste0("G:/Meine Ablage/50_Informatik/100_R/010_Private Projekte/Moving-Head-Tracking/",c_FileName, ".Rmd")|>
  readLines()|>
  suppressWarnings()


##########################################################################
# table of contents
headings <- c_Rmd[stringr::str_detect(c_Rmd, "#")]|>stringr::str_remove_all("#")|>stringr::str_trim()
headings

# Hello
df_data <- data.frame(index = 1:length(c_Rmd),
                      c_Rmd, 
                      is.heading = stringr::str_detect(c_Rmd, "^#")
)

df_data$c_add <- rep("",nrow(df_data))
df_data$`#` <- stringr::str_detect(df_data$c_Rmd, "^#\\s")|>ifelse(1,0)
df_data$`##` <- stringr::str_detect(df_data$c_Rmd, "^##\\s")|>ifelse(1,0)
df_data$`###` <- stringr::str_detect(df_data$c_Rmd, "^###\\s")|>ifelse(1,0)
df_data$`####` <- stringr::str_detect(df_data$c_Rmd, "^####\\s")|>ifelse(1,0)
df_data$`#####` <- stringr::str_detect(df_data$c_Rmd, "^#####\\s")|>ifelse(1,0)
df_data$`######` <- stringr::str_detect(df_data$c_Rmd, "^######\\s")|>ifelse(1,0)

heading_cnt <- rep(0,6)
heading_cnt_ <- rep(TRUE,6)
heading_cnt_[1] <- FALSE
last_heading_edited <- 0

index <- df_data[df_data$is.heading,"index"]
index
ii <- 20

m <- df_data[,names(df_data)[5:ncol(df_data)]]|>as.matrix()
m

# loop through document and check for heading
for (ii in index) {
  if(m[ii,"#"]){
    if(last_heading_edited != m[ii,"#"]){
      heading_cnt[1] <- heading_cnt[1] + 1
      df_data[ii,"#"] <- heading_cnt[1]
      last_heading_edited <- 1
    }
  }
  else if(m[ii,"##"]){
    if(last_heading_edited != m[ii,"##"]){
      heading_cnt[2] <- heading_cnt[2] + 1
      df_data[ii,"##"] <- heading_cnt[2] 
      df_data[ii,"#"] <- heading_cnt[1]
      last_heading_edited <- 2
    }
  }
  else if (m[ii, "###"]) {
    if(last_heading_edited != m[ii, "###"]) {
      heading_cnt[3] <- heading_cnt[3] + 1
      df_data[ii, "###"] <- heading_cnt[3]
      df_data[ii, "##"] <- heading_cnt[2]
      df_data[ii, "#"] <- heading_cnt[1]
      last_heading_edited <- 3
    }
  }
  else if(m[ii,"####"]){
    if(last_heading_edited != m[ii, "####"]) {
      heading_cnt[4] <- heading_cnt[4] + 1
      df_data[ii,"####"] <- heading_cnt[4]
      df_data[ii,"###"] <- heading_cnt[3]
      df_data[ii,"##"] <- heading_cnt[2]
      df_data[ii,"#"] <- heading_cnt[1]
      last_heading_edited <- 4
    }
  }
  else if(m[ii,"#####"]){
    if(last_heading_edited != m[ii, "#####"]) {
      heading_cnt[5] <- heading_cnt[5] + 1
      df_data[ii,"#####"] <- heading_cnt[5]
      df_data[ii,"####"] <- heading_cnt[4]
      df_data[ii,"###"] <- heading_cnt[3]
      df_data[ii,"##"] <- heading_cnt[2]
      df_data[ii,"#"] <- heading_cnt[1]
      last_heading_edited <- 5
    }
  }
  else if(m[ii,"######"]){
    if(last_heading_edited != m[ii, "######"]) {
      heading_cnt[6] <- heading_cnt[6] + 1
      df_data[ii,"######"] <- heading_cnt[6]
      df_data[ii,"#####"] <- heading_cnt[5]
      df_data[ii,"####"] <- heading_cnt[4]
      df_data[ii,"###"] <- heading_cnt[3]
      df_data[ii,"##"] <- heading_cnt[2]
      df_data[ii,"#"] <- heading_cnt[1]
      last_heading_edited <- 6
    }
  }
  print(last_heading_edited)
}

df_data[df_data$is.heading,]|>print()
#   
# m <- df_data[df_data$is.heading,][5:10]|>as.matrix()
# m
# # Check if the first heading is the highest order 
# df_data$`#`[1]>0
# 
# # find first heading order (colum rank)
# index <- df_data[df_data$is.heading,"index"]
# 
# starting_column <- df_data[index[1],10:5]|>paste0(collapse = "")|>as.integer()|>log10()
# starting_column 
# 
# ii <- index[1]
# 
# df_data[index,]
# 
# df_data[df_data$is.heading,5]>0
# df_data[df_data$is.heading,6]>0
# 
# # find first heading with higher column order
# fist_higher_order_index <- 0
# for(ii in index){
#   if(df_data[ii,5]>0){
#     fist_higher_order_index <- ii
#     break
#   }
# }
# fist_higher_order_index
# 
# # How many columns to push pack 
# push_back <- starting_column - (df_data[fist_higher_order_index,10:5]|>paste0(collapse = "")|>as.integer()|>log10()|>floor())
# push_back
# 
# # heading structure 
# m <- df_data[,5:10]|>as.matrix()
# m[df_data$is.heading,]
# 
# m_ <- switch (push_back,
#               m_ = cbind(m,rep(0,nrow(m))),
#               m_ = cbind(m,rep(0,nrow(m)),rep(0,nrow(m))),
#               m_ = cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m))),
#               m_ = cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m))),
#               m_ = cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m))),
#               m_ = cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)))
# )
# 
# cbind(index = df_data$index,m)
# 
# [df_data$is.heading,]
# 
# # shift all heading according to first heading order
# for (ii in index) {
#   if (push_back == 1) {
#     temp <- df_data[ii,5:10]|>as.matrix()|>as.vector()
#     temp
#     m_[ii,] <- c(0,temp)
#   }    
#   if (push_back == 2) {
#     temp <- df_data[ii,5:(10+push_back)]|>as.matrix()|>as.vector()
#     m_ <- cbind(m,rep(0,nrow(m)),rep(0,nrow(m)))
#     m_[ii,] <- c(0,0,temp)
#   } 
#   if (push_back == 3) {
#     temp <- df_data[ii,5:(10+push_back)]|>as.matrix()|>as.vector()
#     m_ <- cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)))
#     m_[ii,] <- c(0,0,0,temp)
#   } 
#   if (push_back == 4) {
#     temp <- df_data[ii,5:(10+push_back)]|>as.matrix()|>as.vector()
#     m_ <- cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)))
#     m_[ii,] <- c(0,0,0,0,temp)
#   } 
#   if (push_back == 5) {
#     temp <- df_data[ii,5:(10+push_back)]|>as.matrix()|>as.vector()
#     m_ <- cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)))
#     m_[ii,] <- c(0,0,0,0,0,temp)
#   } 
#   if (push_back == 6) {
#     temp <- df_data[ii,5:(10-push_back)]|>as.matrix()|>as.vector()
#     m_ <- cbind(m,rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)),rep(0,nrow(m)))
#     m_[ii,] <- c(0,0,0,0,0,0,temp)
#   } 
# }
# m_
# cbind(m_,index = df_data$index)[df_data$is.heading,]
# 
# # Headings 
# m__ <- (m_ > 0)[df_data$is.heading,]
# m__
# 
# heading_cnt <- rep(0,12)
# heading_cnt
# 
# 
# # loop through document to create heading structure
# for (ii in 1:nrow(m__)) {
#   if(m__[ii,1]){
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[1] <- heading_cnt[1] + 1
#     print(m__[ii,])
#   }
#   else if(m__[ii,2]){
#     m__[ii,2]<- heading_cnt[2] + 1
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[2] <- heading_cnt[2] + 1
#     print(m__[ii,])
#   }
#   else if(m__[ii,3]){
#     m__[ii,3] <- heading_cnt[3] + 1
#     m__[ii,2] <- heading_cnt[2]
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[3] <- heading_cnt[3] + 1
#     print(m__[ii,])
#   }
#   else if(m__[ii,4]){
#     m__[ii,4] <- heading_cnt[4] + 1
#     m__[ii,3] <- heading_cnt[3]
#     m__[ii,2] <- heading_cnt[2]
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[4] <- heading_cnt[4] + 1
#     print(m__[ii,])
#   }
#   else if(m__[ii,5]){
#     m__[ii,5] <- heading_cnt[5] + 1
#     m__[ii,4] <- heading_cnt[4]
#     m__[ii,3] <- heading_cnt[3]
#     m__[ii,2] <- heading_cnt[2]
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[5] <- heading_cnt[5] + 1
#     print(m__[ii,])
#   }
#   else if(m__[ii,6]){
#     m__[ii,6] <- heading_cnt[6] + 1
#     m__[ii,5] <- heading_cnt[5]
#     m__[ii,4] <- heading_cnt[4]
#     m__[ii,3] <- heading_cnt[3]
#     m__[ii,2] <- heading_cnt[2]
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[6] <- heading_cnt[6] + 1
#     print(m__[ii,])
#   }    
#   else if(m__[ii,7]){
#     m__[ii,7] <- heading_cnt[7] + 1
#     m__[ii,6] <- heading_cnt[6]
#     m__[ii,5] <- heading_cnt[5]
#     m__[ii,4] <- heading_cnt[4]
#     m__[ii,3] <- heading_cnt[3]
#     m__[ii,2] <- heading_cnt[2]
#     m__[ii,1] <- heading_cnt[1]
#     heading_cnt[7] <- heading_cnt[7] + 1
#     print(m__[ii,])
#   }
#   # else if(m__[ii,8]){
#   #   m__[ii,8] <- heading_cnt[8] + 1
#   #   m__[ii,7] <- heading_cnt[7]
#   #   m__[ii,6] <- heading_cnt[6]
#   #   m__[ii,5] <- heading_cnt[5]
#   #   m__[ii,4] <- heading_cnt[4]
#   #   m__[ii,3] <- heading_cnt[3]
#   #   m__[ii,2] <- heading_cnt[2]
#   #   m__[ii,1] <- heading_cnt[1]
#   #   heading_cnt[8] <- heading_cnt[8] + 1
#   #   index[[cnt]] <- ii
#   #   cnt <- cnt + 1
#   # }
#   # else if(m__[ii,9]){
#   #   m__[ii,9] <- heading_cnt[9] + 1
#   #   m__[ii,8] <- heading_cnt[8]
#   #   m__[ii,7] <- heading_cnt[7]
#   #   m__[ii,6] <- heading_cnt[6]
#   #   m__[ii,5] <- heading_cnt[5]
#   #   m__[ii,4] <- heading_cnt[4]
#   #   m__[ii,3] <- heading_cnt[3]
#   #   m__[ii,2] <- heading_cnt[2]
#   #   m__[ii,1] <- heading_cnt[1]
#   #   heading_cnt[9] <- heading_cnt[9] + 1
#   #   index[[cnt]] <- ii
#   #   cnt <- cnt + 1
#   # }
#   # else if(m__[ii,10]){
#   #   m__[ii,10] <- heading_cnt[10] + 1
#   #   m__[ii,9] <- heading_cnt[9]
#   #   m__[ii,8] <- heading_cnt[8]
#   #   m__[ii,7] <- heading_cnt[7]
#   #   m__[ii,6] <- heading_cnt[6]
#   #   m__[ii,5] <- heading_cnt[5]
#   #   m__[ii,4] <- heading_cnt[4]
#   #   m__[ii,3] <- heading_cnt[3]
#   #   m__[ii,2] <- heading_cnt[2]
#   #   m__[ii,1] <- heading_cnt[1]
#   #   heading_cnt[10] <- heading_cnt[10] + 1
#   #   index[[cnt]] <- ii
#   #   cnt <- cnt + 1
#   # }
#   # else if(m__[ii,11]){
#   #   m__[ii,11] <- heading_cnt[11] + 1
#   #   m__[ii,10] <- heading_cnt[10]
#   #   m__[ii,9] <- heading_cnt[9]
#   #   m__[ii,8] <- heading_cnt[8]
#   #   m__[ii,7] <- heading_cnt[7]
#   #   m__[ii,6] <- heading_cnt[6]
#   #   m__[ii,5] <- heading_cnt[5]
#   #   m__[ii,4] <- heading_cnt[4]
#   #   m__[ii,3] <- heading_cnt[3]
#   #   m__[ii,2] <- heading_cnt[2]
#   #   m__[ii,1] <- heading_cnt[1]
#   #   heading_cnt[11] <- heading_cnt[11] + 1
#   #   index[[cnt]] <- ii
#   #   cnt <- cnt + 1
#   # }
#   # else if(m__[ii,12]){
#   #   m__[ii,12] <- heading_cnt[12] + 1
#   #   m__[ii,11] <- heading_cnt[11]
#   #   m__[ii,10] <- heading_cnt[10]
#   #   m__[ii,9] <- heading_cnt[9]
#   #   m__[ii,8] <- heading_cnt[8]
#   #   m__[ii,7] <- heading_cnt[7]
#   #   m__[ii,6] <- heading_cnt[6]
#   #   m__[ii,5] <- heading_cnt[5]
#   #   m__[ii,4] <- heading_cnt[4]
#   #   m__[ii,3] <- heading_cnt[3]
#   #   m__[ii,2] <- heading_cnt[2]
#   #   m__[ii,1] <- heading_cnt[1]
#   #   heading_cnt[12] <- heading_cnt[12] + 1
#   #   index[[cnt]] <- ii
#   #   cnt <- cnt + 1
#   # }
# }
# 
# m___ <- cbind(df_data[df_data$is.heading,"index"],m__)
# 
# m___
# 
# 
# # Structure string
# c_add <- c("* ",
#            "    + ",
#            "        + ",
#            "            + ",
#            "                + ",
#            "                    + ")
# 
# 
# #source("tabel of contents for Markdown file.R")
# 
# c_FileName <- "test"
# 
# c_Rmd <- paste0("input/",c_FileName, ".Rmd")|>
#   readLines()|>
#   suppressWarnings()
# c_Rmd
# 
# 
# r_toc_for_Rmd(c_Rmd)|>
#   write("output/001.Rmd")
# 
# r_toc_for_Rmd(c_Rmd, T)|>
#   write("output/002.Rmd")
# 
# 
# # render html file 
# rmarkdown::render(paste0("output/001.Rmd"), 
#                   c("html_document"))
# 
# # show html in web browser
# browseURL(paste0("output/001.html"))
# 
# # render html file 
# rmarkdown::render(paste0("output/002.Rmd"), 
#                   c("html_document"))
# 
# # show html in web browser
# browseURL(paste0("output/002.html"))
# 
# ##########################################################################
# c_FileName <- "Moving-Head-Tracking-12"
# 
# c_Rmd <- paste0("G:/Meine Ablage/50_Informatik/100_R/010_Private Projekte/Moving-Head-Tracking/",c_FileName, ".Rmd")|>
#   readLines()|>
#   suppressWarnings()
# c_Rmd[1:20]
# 
# 
# r_toc_for_Rmd(c_Rmd)|>
#   write("output/001.Rmd")
# 
# r_toc_for_Rmd(c_Rmd, T)|>
#   write("output/002.Rmd")
# 
# 
# # render html file 
# rmarkdown::render(paste0("output/001.Rmd"), 
#                   c("html_document"))
# 
# # show html in web browser
# browseURL(paste0("output/001.html"))
# 
# # render html file 
# rmarkdown::render(paste0("output/002.Rmd"), 
#                   c("html_document"))
# 
# # show html in web browser
# browseURL(paste0("output/002.html"))