
root <- "~/Desktop/Projects/Restaurant_Visitor_Forecast"
setwd(root)
files <- list.files()

for(i in 1:length(files)){
        unzip(zipfile = paste0(root, "/", "zip_files", "/", files[i]),
              exdir = paste0(root, "/", "csvs"))
}


