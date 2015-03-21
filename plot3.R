setwd("G:/Coursera/courseraworkspace/exploratorydataanalysis/exdata_plotting2")
unzip("./exdata_data_NEI_data.zip")

# Check if both data exist in the environment. If not, load the data.
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./Source_Classification_Code.rds")
}
subset <- neiData[neiData$fips == "24510", ]
# if (!"load_data.R" %in% list.files()) {
# setwd("~/Desktop/Online Coursera/Coursera-Exploratory-Data-Analysis/ExData_Plotting2/")
# }
# source("load_data.R")
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot3.png",
    width = 480, height = 480,
    units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()


# ## Another way of plotting (same result)
# 
# # Utilize plyr to split-apply-combine to simplify our dataset
# library(plyr)
# # Utilizing ggplot2 for this plot
# library(ggplot2)
# 
# unzip("./exdata_data_NEI_data.zip")
# 
# # Read in the data file from disk. These are RDS files
# SCC <- readRDS("./Source_Classification_Code.rds")
# NEI <- readRDS("./summarySCC_PM25.rds")
# 
# # Summarize the emissions by year and Baltimore City to simplify the plot
# balt <- ddply(NEI[NEI$fips == "24510", ],
# .(type,year), summarise,
# TotalEmissions = sum(Emissions))
# 
# # Set the graphics device to png
# png(filename = "./plot32.png")
# 
# # Plot the data -- finding total emissions each year
# 
# ggplot(balt, aes(year, TotalEmissions, colour = type)) +
# geom_line() + geom_point() +
# labs(title = "Total Emissions by Type in Baltimore",
# x = "Year", y = "Total Emissions")
# 
# # Decided against facets since the range for Baltimore is small
# # facet_grid(type~., scales = "free") +
# 
# dev.off()