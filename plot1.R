#---------------------------------
#            PLOT 1
#---------------------------------

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?. Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#---------------------------------

# Install and load packages

install.packages("scales")
library("scales")

install.packages("ggplot2") 
library(ggplot2)

## Download, read and load file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(url, dest = "dataset.zip")

unzip ("dataset.zip")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate all the emission per year (1999-2002-2005-2008)

all_NEI <- aggregate(Emissions ~ year, NEI, sum)

# Plot all_NEI

ggplot(all_NEI, aes(x = year, y = Emissions)) + 
  geom_line(color = 11) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = expression("Total US "~ PM[2.5]~ "Emissions by Year"),
    x = "Years",
    y = expression("Total US "~   PM[2.5] ~ "Emissions")) +
  theme(plot.title = element_text(hjust = 0.5)) 

## Plot to png

dev.copy(png, file =  "plot1.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
