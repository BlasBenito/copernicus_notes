Notes on the Copernicus platform
================

-   [Objective](#objective)
-   [Copernicus](#copernicus)
-   [Global Land Service (CGLS)](#global-land-service-cgls)
-   [Copernicus Climate Change Service
    (C3S\*)](#copernicus-climate-change-service-c3s)
-   [R resources](#r-resources)
-   [Python resources](#python-resources)
-   [Examples of potential use](#examples-of-potential-use)


## Copernicus

[Copernicus](https://www.copernicus.eu/en) is the Earth observation
programme of the European Union. It is implemented in partnership with
the Member States, the European Space Agency (ESA), the European
Organisation for the Exploitation of Meteorological Satellites
(EUMETSAT), the European Centre for Medium-Range Weather Forecasts
(ECMWF), EU Agencies and Mercator Océan.

According to the [License to use Copernicus
Products](https://cds.climate.copernicus.eu/api/v2/terms/static/licence-to-use-copernicus-products.pdf),
*access to Copernicus Products is given for any purpose in so far as it
is lawful, whereas use may include, but is not limited to: reproduction;
distribution; communication to the public; adaptation, modification and
combination with other data and information; or any combination of the
foregoing.*

The data is provided to the end users via the
[`Copernicus Open Access Hub`](https://scihub.copernicus.eu/), either
via a [graphical user
interface](https://scihub.copernicus.eu/dhus/#/home) or an
[API](https://scihub.copernicus.eu/twiki/do/view/SciHubWebPortal/APIHubDescription)
(see technical details
[here](https://scihub.copernicus.eu/twiki/do/view/SciHubUserGuide/BatchScripting?redirectedfrom=SciHubUserGuide.8BatchScripting)).

## Global Land Service (CGLS)

The [Global Land Service](https://land.copernicus.eu/global/index.html)
contains a large [set of
products](https://land.copernicus.eu/global/products), being [many of
them](https://land.copernicus.eu/global/products) focused on vegetation
dynamics (the complete catalogue of services can be found
[here](https://www.copernicus.eu/en/accessing-data-where-and-how/copernicus-services-catalogue?cc_source_service_target_id%5B2775%5D=2775&combine=)):

-   Fraction of Absorbed Photosynthetically Active Radiation
    ([FAPAR](https://land.copernicus.eu/global/products/fapar)).
-   Fraction of green vegetation cover
    ([FCOVER](https://land.copernicus.eu/global/products/fcover)).
-   Leaf Area Index
    ([LAI](https://land.copernicus.eu/global/products/lai)).
-   Normalized Difference Vegetation Index
    ([NDVI](https://land.copernicus.eu/global/products/ndvi)).
-   Dry Matter Productivity
    ([DMP](https://land.copernicus.eu/global/products/dmp)).
-   Vegetation Condition Index
    ([VCI](https://land.copernicus.eu/global/products/vci)).
-   Vegetation Productivity Index
    ([VPI](https://land.copernicus.eu/global/products/vpi)).
-   Surface Soil Moisture
    ([SSM](https://land.copernicus.eu/global/products/ssm)). Europe:
    daily resolution
-   Soil Water Index
    ([SWI](https://land.copernicus.eu/global/products/swi)). Europe, 1km
    resolution, and Global at 12.5 km.
-   Land Surface Temperature:
    <https://land.copernicus.eu/global/products/lst>

The manifest files are here:
<https://land.copernicus.vgt.vito.be/manifest/>

## Copernicus Climate Change Service (C3S\*)

The [Climate Change Service](https://climate.copernicus.eu/) provides
authoritative
[data](https://cds.climate.copernicus.eu/cdsapp#!/search?type=dataset)
for climate change mitigation and adaptation.

Such data can be accessed through the [Climate Data Store
(CDS)](https://cds.climate.copernicus.eu/cdsapp#!/home) via a
[toolbox](https://cds.climate.copernicus.eu/cdsapp#!/toolbox) and a
[Python API](https://cds.climate.copernicus.eu/api-how-to). The flagship
dataset in there is
[ERA5](https://www.ecmwf.int/en/forecasts/datasets/reanalysis-datasets/era5),
produced by the [European Centre for Medium-Range Weather Forecasts
(ECMWF)](https://www.ecmwf.int/). ERA5 is an hourly climate dataset
built from weather observations and climate simulations at 9km
resolution from 1950 to the present time. There are several datasets
derived from ERA5 that might be of interest for BIOME MAKERS:

-   [ERA5-Land](https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-era5-land?tab=overview):
    global dataset at 9km spatial resolution and hourly temporal
    resolution representing weather, water, and soil variables from 2m
    above the surface to a soil depth of 289cm. Examples of variables
    contained in this dataset are: 2m dewpoint temperature, 2m
    temperature, evaporation from vegetation transpiration, leaf area
    index, potential evaporation, snow cover and density, soil
    temperature (five levels: 0-7, 7-28, 28-100, and 100-289 cm),
    surface runoff, and total precipitation.
-   [ERA5-Land montly averages from 1981 to
    present](https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-era5-land-monthly-means?tab=overview):
    Same variables as in ERA5-Land, but at a monthly temporal resolution
    from 1981.
-   [AgERA5: Agrometeorological indicators from 1979 to
    present](https://cds.climate.copernicus.eu/cdsapp#!/dataset/sis-agrometeorological-indicators?tab=overview):
    Global daily surface meteorological data at 9km resolution from 1979
    to presentf for agriculture and agro-ecological studies.

## R resources

-   Package [KrigR](https://github.com/ErikKusch/KrigR): download and
    downscaling of ERA5 data.
-   Package [ecmwfr](https://github.com/bluegreen-labs/ecmwfr): download
    of ERA5 data.
-   Package [RCGLS](https://CRAN.R-project.org/package=RCGLS): download
    [Copernicus manifest
    files](https://land.copernicus.eu/global/manifest-files) with links
    to file locations.
-   Package [esd](https://github.com/metno/esd/): weather data analysis
    and statistical downscaling. The function
    [ERA5.CDS](https://rdrr.io/github/metno/esd/man/ERA5.CDS.html)
    allows subsetting by coordinates.
-   Package [CSTools](https://CRAN.R-project.org/package=CSTools):
    download, downscaling, and analysis of ERA5 data.
-   Package [elevatr](https://github.com/jhollist/elevatr/): provides
    functions (like
    [get\_opentopo()](https://rdrr.io/cran/elevatr/man/get_opentopo.html))
    to download digital elevation models useful to downscale climate
    data.
-   [Tutorial on how to access ERA5 data with R by Dominic
    Royé](https://dominicroye.github.io/en/2018/access-to-climate-reanalysis-data-from-r/).
-   [Tutorial on how to download CGLS data with R (by personnel of the
    Copernicus
    platform)](https://github.com/cgls/Copernicus-Global-Land-Service-Data-Download-with-R)
-   [GitHub page of the CGLS](https://github.com/cgls). Contains
    examples on how to work with the CGLS data with R and Python.

## Python resources

-   [CDS API](https://cds.climate.copernicus.eu/api-how-to) and its
    [GitHub page](https://github.com/ecmwf/cdsapi).
-   Package
    [stactools-cgls-lc100](https://pypi.org/project/stactools-cgls-lc100/):
    Subpackage for working with Copernicus Global Land Cover Layers data
    in stactools, a command line tool and Python library for working
    with STAC.

# Examples of potential use
