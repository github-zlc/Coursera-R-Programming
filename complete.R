# part of the code is based on pollutantmean.R file on file extracting


complete <- function(directory, id = 1:332){
  
  # set working directory
  wd <- file.path(getwd(),"specdata")
  setwd(wd)
  
  #create a data frame of two columns with id and nobs value of all NA's
  df <- data.frame("id" = id, "nobs" = NA)
  
  for (i in id) {    # for loop as for each id
    rn <- which(df == i)
    #read the file first 
    if (i < 10){
      x <- read.csv(paste("0","0",as.character(i),".csv",sep=""),header = TRUE)
    } else if (i >= 10 & i < 100) {
      x <- read.csv(paste("0",as.character(i),".csv",sep=""),header = TRUE)
    } else {
      x <- read.csv(paste(as.character(i),".csv",sep=""), header = TRUE)
    }
    
    completex <- x[complete.cases(x),]  # find complete cases of that ID
    nob <- nrow(completex)  # count number of complete cases
    df[rn,2] <- nob    # replace NA value with its true nob value
  }
  
  # reset working directory
  setwd("..")
  df
}

# Code below is an example copied from xmuxiaomo
# url: https://xmuxiaomo.github.io/2015/06/10/R-Programming-Assignment-1/

# complete <- function(directory, id = 1:332) {
#   files_full <- list.files(directory, full.names = TRUE)
#   dat <- data.frame()
#   
#   for (i in id) {
#     moni_i <- read.csv(files_full[i])
#     nobs <- sum(complete.cases(moni_i))
#     tmp <- data.frame(i, nobs)
#     dat <- rbind(dat, tmp)
#   }
#   
#   colnames(dat) <- c("id", "nobs")
#   dat
# }