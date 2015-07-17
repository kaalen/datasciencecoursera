pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  #Get a list of files
  files <- list.files(directory, full.names=TRUE)
  
  #Combine all data filtered by id
  data <- data.frame()
  for(i in id){
    data <- rbind(data, read.csv(files[i]))
  }
  mean <- mean(data[, pollutant], na.rm=TRUE)
}
