#---------------------------------
#            PLOT 5
#---------------------------------

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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

# Filter only data from Baltimore and motor vehicles

balti <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")


# Aggregate all the emission per year and type for Baltimore (1999-2002-2005-2008)

motor_balti <- aggregate(Emissions ~ year + type, balti, sum)


# Plot motor_balti

ggplot(motor_balti, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total Baltimore's motor vehicles" ~ PM[2.5] ~ "Emissions by Type and Year")) +
        ylab(expression("Total Baltimore's motor vehicles " ~ PM[2.5] ~ "Emissions")) +
        xlab("Years") 


## Plot to png

dev.copy(png, file =  "plot5.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
