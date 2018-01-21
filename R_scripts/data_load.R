
root <- "~/Desktop/Projects/Restaurant_Visitor_Forecast/csvs"
setwd(root)
files <- list.files()

csv_files <- files[grep(".csv$", files)]
set_names <- gsub("\\.csv", "", csv_files)

for(i in 1:length(csv_files)){
        temp <- read.csv(file = paste0(root, "/", csv_files[i]))
        assign(set_names[i], temp)
}


