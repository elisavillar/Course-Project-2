#---------------------------------
#            PLOT 6
#---------------------------------

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

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


# Filer data of Los Angeles, Baltimore and motor vehicles

balti_losAngeles_motors <- subset(NEI, NEI$fips %in% c("24510", "06037") & NEI$type == "ON-ROAD")


# Aggregate all the emission per year

all_balti_losAngeles_motors <- aggregate(Emissions ~ year + fips, balti_losAngeles_motors, sum)


# Plot type_balti

ggplot(all_balti_losAngeles_motors, aes(year, Emissions, col = fips)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Baltimore and Los Angeles's Motor vehicles " ~ PM[2.5] ~ "Emissions by Type and Year")) +
        ylab(expression("Baltimore and Los Angeles's Motor vehicles " ~ PM[2.5] ~ "Emissions")) +
        xlab("Years") 


## Plot to png

dev.copy(png, file =  "plot6.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
