# RGDAL Explore Shape File Example
# 05 November 2015
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

####### New Material ########

# Extract the attributes from the shape file

# Note @data will work as well as as.data.frame()
# fileAttributes <- fileData@data

fileAttributes <- as.data.frame(fileData)

# Get a list of the attribute names

attributeNames <- colnames(fileAttributes)

# Extract the first polygon in the shape file (Alabama)

alabamaShape <- fileData[1, ]

# See the readme.Rmd for the plot example




