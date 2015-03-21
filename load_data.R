setwd("G:/Coursera/courseraworkspace/exploratorydataanalysis/exdata_plotting2")
unzip("./exdata_data_NEI_data.zip")
# Check if both data exist. If not, load the data.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./Source_Classification_Code.rds")
}
head(neiData)
head(sccData)
dim(neiData) # 6497651 6
dim(sccData) # 11717 15