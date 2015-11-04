# RGDAL Load Shape File Example
# 02 November 2015
# Donald R. Mackert

# Load the library rgdal
# Assumes the rgdal package is installed install.packages('rgdal')

library("rgdal")

# Set the data directory
# The US Administrative Boundaries from http://www.gadm.org/ will be used

# Set the data directory

dataDirectory <- "/Users/mackertd/GeoSpatial/USA_adm"

# Set the shape file name - USA_adm1.shp
# This the US administrative boundary one file

shapeName <- "USA_adm1.shp"

# Create the filename

fileName <- paste(dataDirectory, "/", shapeName, sep = "")

# Test to see if the file exists

if(file.exists(fileName)) {
      
      # Get the layer names
      
      fileLayers <- ogrListLayers(dsn = fileName)
      
      # Get the file information for the first layer
      
      fileInfo <- ogrInfo(dsn = fileName, fileLayers[1])
      
      # Load the file for the first layer
      
      fileData <- readOGR(dsn = fileName, fileLayers[1])
      
} else {
      
      stop("File not found")
      
}



