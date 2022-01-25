#---------------------------------
#            PLOT 3
#---------------------------------

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

#---------------------------------

#Install and load packages

install.packages("ggplot2")
library(ggplot2)

## Download, read and load file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(url, dest = "dataset.zip")

unzip ("dataset.zip")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Filter only data from Baltimore

balti <- subset(NEI, NEI$fips == "24510")

# Aggregate all the emission per year and type for Baltimore (1999-2002-2005-2008)

type_balti <- aggregate(Emissions ~ year + type, balti, sum)

# Plot type_balti

options(scipen = 5)

plot(all_balti$year, all_balti$Emissions,
     pch = 18,
     col = "#006666",  
     type = "b",
     lwd = 2,
     main = expression("Total Baltimore "~ PM[2.5]~ "Emissions by Year"), 
     ylab = expression("Total Baltimore "~   PM[2.5] ~ "Emissions"), 
     xlab = "Years")

## Plot to png

dev.copy(png, file =  "plot3.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
