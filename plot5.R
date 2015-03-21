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
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot5.png",
    width = 480, height = 480,
    units = "px")
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")
plot(motorEmissions, type = "l", xlab = "Year",
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City",
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
# ## Another understanding (different result)
#
# # Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
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
# Summarise the totals for sources in Baltimore City and type ON-ROAD to capture motor vehicles
# motor <- ddply(NEI[NEI$fips == "24510"
# & NEI$type == "ON-ROAD",],
# .(type,year), summarise,
# TotalEmissions = sum(Emissions))
#
# # Set the graphics device to png
# png(filename = "./plot52.png")
#
# # Plot the data -- finding total emissions each year
# ggplot(motor, aes(year, TotalEmissions)) +
# geom_line() + geom_point() +
# labs(title = "Total Emissions from Motor Vehicles in Baltimore City",
# x = "Year", y = "Total Emissions")
#
# dev.off()