#---------------------------------
#            PLOT 2
#---------------------------------

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

#---------------------------------

## Download, read and load file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(url, dest = "dataset.zip")

unzip ("dataset.zip")

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Filter only data from Baltimore

balti <- subset(NEI, NEI$fips == "24510")

# Aggregate all the emission per year for Baltimore (1999-2002-2005-2008)

all_balti <- aggregate(Emissions ~ year, balti, sum)

# Plot all_Baltimore

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

dev.copy(png, file =  "plot2.png", 
         width = 480, 
         height = 480, 
         units = "px")   

dev.off()   
