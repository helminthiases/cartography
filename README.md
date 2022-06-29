<br>

**Cartography**

Repository Branches: master & develop

<br>

### Notes

The foci herein are project maps, and map derived estimates.  For site level estimates &rarr;

* Read-in the Administration Level 2 shapes.
* Extract the co&ouml;rdinates per administration area
* Create a raster map of a feature via administration area co&ouml;rdinates & administration area feature values
* Extract site level values from the raster.

**Or, just**

* Create a raster map of a feature via geospatial feature values.
* Extract site level values from the raster.

<br>

Administrative Areas:

* [Global Administrative Areas (GADM)](https://gadm.org)
* [Global Colaboration Engine](http://globe.umbc.edu)
* [GADM & GLOBE](http://globe.umbc.edu/documentation-overview/global-administrative-areas-gadm/)
* The co&ouml;rdinate reference system details of a GADM map are visible at the bottom of 
  [a country page](https://gadm.org/download_country.html), after selecting a country.  It is ``EPSG:4326``.

<br>

References of interest:

* [ESPEN](https://espen.afro.who.int/)
  * [ESPEN Cartography Database](https://espen.afro.who.int/tools-resources/cartography-database)
  * [ESPEN API](https://admin.espen.afro.who.int/docs/api)
  * [ESPEN API Documentation](https://espen.stoplight.io)
* [Spatial Data](https://www.diva-gis.org)
* [IHME WASH](https://www.healthdata.org/research-article/mapping-geographic-inequalities-access-drinking-water-and-sanitation-facilities-low)
* [National Oceanic & Atmospheric Administration (NOAA)](https://www.ncdc.noaa.gov/cdo-web/datasets)
* [WorldClim](https://www.worldclim.org/data/index.html)
* [Map projections](https://www.usgs.gov/publications/map-projections)


<br>

Temporary:  Examples of WASH maps &rarr;

* [IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_LOWER_2000_Y2020M06D02.TIF](https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?path=%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent&files=IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_LOWER_2000_Y2020M06D02.TIF)

* [IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_LOWER_2001_Y2020M06D02.TIF](https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?path=%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent&files=IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_LOWER_2001_Y2020M06D02.TIF)

* [IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_UPPER_2016_Y2020M06D02.TIF](https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?path=%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent&files=IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_UPPER_2016_Y2020M06D02.TIF)

* [IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_UPPER_2017_Y2020M06D02.TIF](https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy/download?path=%2FS_PIPED%20-%20Access%20to%20sewer%20and%20septic%20sanitation%20facilities%20%5BGeoTIFF%5D%2FPercent&files=IHME_LMIC_WASH_2000_2017_S_PIPED_PERCENT_UPPER_2017_Y2020M06D02.TIF)

<br>
<br>

### Try / Switch

Switch to ``parallel::`` later.

```R
clusters <- parallel::makeCluster(parallel::detectCores())
parallel::parLapply(clusters, ..., ...)
parallel::stopCluster(c1 = clusters)
```

<br>
<br>

### Snippets

```R
# IHME LMIC WASH Estimates 2000 - 2017 Administration Level 2 Piped Sanitation Y2020M06D02
# Access to sewer and septic sanitation facilities [GeoTIFF]
uri <- 'data/points/IHME_LMIC_WASH_2000_2017_S_PIPED_ADMIN_2_Y2020M06D02.csv'
url <- 'https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy?path=%2FData%20%5BCSV%5D%2FAdmin%202&files=IHME_LMIC_WASH_2000_2017_S_PIPED_ADMIN_2_Y2020M06D02.zip'

records <- data.table::fread(file = uri, strip.white = TRUE)
str(records)

# The number of unique countries
length(x = unique(records$ADM0_CODE))
```

<br>
<br>

### Independent Development Environment

* Edit the help file skeletons in 'man', possibly combining help files
  for multiple functions.
* Edit the exports in 'NAMESPACE', and add necessary imports.
* Put any C/C++/Fortran code in 'src'.
* If you have compiled code, add a useDynLib() directive to
  'NAMESPACE'.
* Run R CMD build to build the package tarball.
* Run R CMD check to check the package tarball.

Read "Writing R Extensions" for more information.
