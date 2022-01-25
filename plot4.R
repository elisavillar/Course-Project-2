#---------------------------------
#            PLOT 4
#---------------------------------

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

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


# Filter coal from SCC EI Sector and get emissions from NEI data

SCC_coal <- SCC[grepl("coal", SCC$EI.Sector, ignore.case = T),]

NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC,]

all_coal <- aggregate(Emissions ~ year + type, NEI_coal, sum)


# Plot all_coal

ggplot(all_coal, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total US " ~ PM[2.5] ~ "Caol Emissions by Type and Year")) +
        ylab(expression("Total US " ~ PM[2.5] ~ "Caol Emissions")) +
        xlab("Years") 


## Plot to png

dev.copy(png, file =  "plot4.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
