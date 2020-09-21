

corr <- function(directory, threshold = 0){
  
  #setting working directory
  wd <- file.path(getwd(),"specdata")
  setwd(wd)
  
  id <- 1:332
  threshold <- threshold
  res <- c(rep(0,332))  # create a vector of length 332 with all 0's, elements
                        # will be replaced or removed.
  
  for (i in id) {    # for loop as for each id
    
    #read the file first 
    if (i < 10){
      x <- read.csv(paste("0","0",as.character(i),".csv",sep=""),header = TRUE)
    } else if (i >= 10 & i < 100) {
      x <- read.csv(paste("0",as.character(i),".csv",sep=""),header = TRUE)
    } else {
      x <- read.csv(paste(as.character(i),".csv",sep=""), header = TRUE)
    }
    
    completex <- x[complete.cases(x),] # find the complete cases of that id
    nob <- nrow(completex)             # count the number of complete cases
    
    if (nob > threshold){
      res[i] <- cor(completex$sulfate, completex$nitrate) # if greater than threshold, replace the element.
    } else {
      res[i] <- NA    # make it NA if smaller or equal to threshold
    }
  }
  
  # reset working directory
  setwd("..")
  
  res[complete.cases(res)]
}
