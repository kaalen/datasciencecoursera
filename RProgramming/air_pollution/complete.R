complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- list.files(directory, full.names=TRUE)
  results <- data.frame("id"=numeric(), "nobs"=numeric())
  
  row_idx <- 1
  for(i in id){
    monitor_data <- read.csv(files[[i]])
    ok <- complete.cases(monitor_data)
    t <- sum(ok)
    results[row_idx,1] <- i
    results[row_idx,2] <- t
    row_idx <- row_idx + 1
  }
  results
}
