# Initially I was trying to get the mean value of each pollutant under each ID
# Then get the mean value of all mean values from the entire 332 ID's
# Facing the rounding issue because my code would round two times during the process
# Change it to calculate the sum of all non-NA pollutant values
# Then count the number of avaliable pollutant values
# Finally use total values diveded by the count to get the mean

pollutantmean <- function(directory,pollutant, id = 1:332){
  
  # set working directory first
  wd <- file.path(getwd(),"specdata")
  setwd(wd)
  
  total <- 0        # initialize the total value of pollutant of 0
  count <- 0        # initialize the total count of avaliable pollutant of 0
  for (i in id){    # for loop as for each id
    
    #read the file first 
    if (i < 10){
      x <- read.csv(paste("0","0",as.character(i),".csv",sep=""),header = TRUE)
    } else if (i >= 10 & i < 100) {
      x <- read.csv(paste("0",as.character(i),".csv",sep=""),header = TRUE)
    } else {
      x <- read.csv(paste(as.character(i),".csv",sep=""), header = TRUE)
    }
    
    # extract the dataset by seperating each pollutant
    if (pollutant == "sulfate"){
      data <- x$sulfate
    } else {
      data <- x$nitrate
    }
    
    data <- data[complete.cases(data)] # remove NA values
    total <- total + sum(data)         # get the total value
    count <- count + length(data)      # get the total count
  }
  setwd("..")
  return(total/count)                 # calculate the mean, only round once by default
  
  # reset working directory
}

# Code below is an example copied from xmuxiaomo
# url: https://xmuxiaomo.github.io/2015/06/10/R-Programming-Assignment-1/

# pollutantmean <- function(directory, pollutant, id = 1:332) {
#   files_full <- list.files(directory, full.names = TRUE) 
#   
#   dat <- data.frame()
#   
#   for (i in id) {
#     dat <- rbind(dat, read.csv(files_full[i]))
#   }
#   
#   mean(dat[, pollutant], na.rm = TRUE)
# }

