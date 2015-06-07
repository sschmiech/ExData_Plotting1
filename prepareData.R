#check if perpare data is avaible
getData <- function() {
  if(!file.exists("./data/preparedData.rds")){loadData()}
  return (readRDS(file = "./data/preparedData.rds"))
}
#load and prepare data
loadData <- function() {
  ##IF NECESSARY ./DATA FILE DOES NOT EXIST THEN CREATE IT
  if(!file.exists("./data")){dir.create("./data")}
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  
  download.file(fileUrl,destfile="./data/Dataset.zip",method="auto")
  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
  get_file_path <- file.path("./data" , "household_power_consumption.txt")
  
  ##READ Data
  #startLine <- grep("^[12]/2/2007", get_file_path)
  interestingRows <- grep("^[12]/2/2007",readLines(get_file_path))
  start <- head(interestingRows, n=1)-1
  end <-   tail(interestingRows, n=1)
  #rm(interestingRows)
  
  data   <- read.table(get_file_path, skip=start,nrows=end-start, header = FALSE, sep =';')
  colnames( data ) <- unlist(read.table(get_file_path, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE))
  data$timestamp <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  #tidy up
  data$Date <- NULL
  data$Time <- NULL
  data <- data[,c(8,1:7)]
  
  #save the data 
  saveRDS(data, file = "./data/preparedData.rds")
}