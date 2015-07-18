corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  #get complete cases to be used as filter
  cases <- subset(complete(directory), nobs > threshold)
  
  files <- list.files(directory, full.names=TRUE)
  results <- numeric()
  
  for(i in cases$id){
    monitor_data <- read.csv(files[[i]])
    cr <- cor(x=monitor_data$sulfate, y=monitor_data$nitrate, use="complete.obs")
    results <- c(results, cr)
  }
  results
  
}