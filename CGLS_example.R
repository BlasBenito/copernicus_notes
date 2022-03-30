############################################################################################################################
#
#COPERNICUS GLOBAL LAND SERVICE (CGLS) DATA DOWNLOAD AND READ: EXAMPLE
#
#This is an example on how to run the functions found in 'land.Copernicus Data Download.R'
#
#These functions allow to automatically download data provided by the Copernicus Global Land Service and open this data in R.
#See: https://land.copernicus.eu/global/
#
#These functions rely on the data provided in the data manifest of the Copernicus service.
#These functinos allow to download the data without ordering products first,
#but you need to register at https://land.copernicus.eu/global/ and create a username and password.
#
#Set your path, username, password, timeframe, product, resolution and if more than 1 version exists, version number. New products are created regularly.
#
#Be aware that Copernicus nc files have lat/long belonging to the centre of the pixel, and R uses upper/left corner:  nc_open.CGLS.data opens the orginal data without adjusting 
#coordinates, while ncvar_get_CGSL.data and stack.CGLS.data open the data and adjust the coordinates.
#
#These functions are distributed in the hope that they will be useful,
#but without any warranty.
#
#Author: Willemijn Vroege, ETH Zurich
#E-mail: wvroege@ethz.ch
#Acknowlegdments: Many thanks to Tim Jacobs, VITO, Copernicus Global Help Desk and Xavier Rotllan Puig, Aster Projects for constructive feedback.
#
#
#First version: 28.10.2019
#Last update  : 12.06.2020
#
###########################################################################################################################


## Reading Functions ####
source("functions.R")

#loading libraries
library(raster)
library(RCurl)
library(ncdf4)


#file manifests: https://land.copernicus.vgt.vito.be/manifest/

#relevant products, resolutions, and versions

#333m resolution, global, 2014 - today (with exceptions), 10 days temporal resolution.
# ----------------

#gdmp300 v1: dry matter productivity: dry biomass increase (kg/ha/day). 

#fapar300 v1: fraction of the solar radiation absorbed by live leaves. 

#fcover300 v1: fraction of ground covered by green vegetation. 

#lai300 v1: leaf area index, thickness of the vegetation cover. 

#ndvi300 v1: vegetation index.

#ndvi300 v2: vegetation index, july 2020 - present.



#1km resolution not in 333m resolution
# ----------------

#tocr v1: top of canopy reflectance, raction of the sunlight reflected by the surface of the Earth. 1999 to Aug 2018, global, 10 days resolution.



#5km resolution not in 333m resolution
# ----------------

#lst10-dc v1: land surface temperature daily cycle, 10 days, 2017 - present.

#lst10-dc v2: land surface temperature daily cycle, 10 days, 2021 - present.


#12.5km resolution not in 333m resolution
# ----------------

#swi10 v3: soil water index. Global, 2007 - present, 10 days resolution.




## Downloading Data ####
#SET TARGET DIRECTORY USERNAME, PASSWORD, TIMEFRAME OF YOUR INTEREST AND PRODUCT (constising of a product, resolution and version).
#Check https://land.copernicus.eu/global/products/ for a product overview and product details
#check https://land.copernicus.vgt.vito.be/manifest/ for an overview for data availability in the manifest

path       <- "/media/workshop/copernicus_downloads" #INSERT TARGET DIRECTORY, for example: D:/land.copernicus
username   <- "blasbenito" #INSERT USERNAME
password   <- "bmcbp6791" #INSERT PASSWORD
timeframe  <- seq(as.Date("2021-03-01"), as.Date("2021-13-01"), by="days") #INSERT TIMEFRAME OF INTEREST, for example June 2019
product    <- "ssm" #INSERT PRODUCT VARIABLE;(for example fapar) -> CHOSE FROM fapar, fcover, lai, ndvi,  ssm, swi, lst, ...
resolution <- "300m" #INSERT RESOLTION (1km, 300m or 100m)
version    <- "v2" #"INSERT VERSION: "v1", "v2", "v3",...

download.CGLS.data(
  path = path, 
  username = username, 
  password = password, 
  timeframe = timeframe, 
  product = product, 
  resolution = resolution, 
  timeout = 100000,
  version = version
  )


## Reading Single netCDF File #### 
#This function is to open and explore a nc file. Be aware that Copernicus nc files have lat/long belonging to the centre of the pixel, 
#and R uses upper/left corner --> therefore adjust coordinates with ncvar_get_CGSL.data before using the netCDF file further!
#SET TARGET DIRECTORY, TIMEFRAME OF YOUR INTEREST AND PRODUCT (constising of a product, resolution and version).

PATH       <- "D:/land.copernicus" #INSERT DIRECTORY, for example: D:/land.copernicus
DATE       <- "2019-06-13" #INSERT DATE OF INTEREST, for example June 13 2019
PRODUCT    <- "fapar" #INSERT PRODUCT VARIABLE;(for example fapar) -> CHOSE FROM fapar, fcover, lai, ndvi,  ss, swi, lst, ...
RESOLUTION <- "1km" #INSERT RESOLTION (1km, 300m or 100m)
VERSION    <- "v1" #"INSERT VERSION: "v1", "v2", "v3",...
VARIABLE   <- "FAPAR" #INSERT VARIABLE NAME, for example: FAPAR, FAPAR_ERR, FAPAR_QFLAG, LMK, NMOD, ssm, ssm_noise, ... . -->Go to the product site e.g. https://land.copernicus.eu/global/products/ssm) and check for available variable names under the tap 'techinal'

#just explore
nc      <- nc_open.CGLS.data   (path=PATH,date=DATE, product=PRODUCT, resolution=RESOLUTION, version=VERSION)

#get data of a specific variable (with adjusted coordinates)
nc_data <- ncvar_get_CGSL.data (path=PATH,date=DATE, product=PRODUCT, resolution=RESOLUTION, version=VERSION, variable=VARIABLE)


## Reading all Files within a Timeframe as Raster Stack####
#SET TARGET DIRECTORY, TIMEFRAME OF YOUR INTEREST AND PRODUCT (constising of a product, resolution and version).

PATH       <- "D:/land.copernicus" #INSERT DIRECTORY, for example: D:/land.copernicus
TIMEFRAME  <- seq(as.Date("2019-06-01"), as.Date("2019-06-15"), by="days") #INSERT TIMEFRAME OF INTEREST, for example June 2019
PRODUCT    <- "fapar" #INSERT PRODUCT VARIABLE;(for example fapar) -> CHOSE FROM fapar, fcover, lai, ndvi,  ss, swi, lst, ...
RESOLUTION <- "1km" #INSERT RESOLTION (1km, 300m or 100m)
VERSION    <- "v1" #"INSERT VERSION: "v1", "v2", "v3",...
VARIABLE   <- "FAPAR" #INSERT VARIABLE NAME, for example: FAPAR, FAPAR_ERR, FAPAR_QFLAG, LMK, NMOD, ssm, ssm_noise, ... . -->Go to the product site e.g. https://land.copernicus.eu/global/products/ssm) and check for available variable names under the tap 'techinal'

data   <- stack.CGLS.data(path=PATH,timeframe=TIMEFRAME, product=PRODUCT, resolution=RESOLUTION, version=VERSION, variable=VARIABLE)

