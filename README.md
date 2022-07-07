<br>

## Geospatial Variables

<br>

Remember, each observation of an ESPEN STH experiments data set - the data set of a country across years - includes the variables

<br>

variable | description
:--- | :---
iso2 | The ISO 3166-1 alpha-2 country code, i.e., the two-letter country code.
iso3 | The ISO 3166-1 alpha-3 country code, i.e., the three-letter country code.
admin1_id | A country's administrative division 1 code.
admin2_id | A country's administrative division 2 code.
longitude | The longitude geographic co&ouml;rdinate value.
latitude | The latitude geographic co&ouml;rdinate value.

<br>

and much more.  Due to the presence of the latitude & longitude values, we can extract feature value estimates from 
geospatial variable objects.  Hence, the focus herein is the derivation of features estimates of interest, per location 
within a STH ESPEN data set.

Initially, the features of interest are WASH (water, sanitation, and hygiene) features.  For a preview of estimations thus far, 
explore the [warehouse/ESPEN/experiments/extended](./warehouse/ESPEN/experiments/extended) files - each should have 
appended variables. 

<br>
<br>

### References


#### WASH

* [IHME WASH](https://www.healthdata.org/research-article/mapping-geographic-inequalities-access-drinking-water-and-sanitation-facilities-low)


#### Administrative Areas

* [Global Administrative Areas (GADM)](https://gadm.org)
* The co&ouml;rdinate reference system details of a GADM map are visible at the bottom of 
  [a country page](https://gadm.org/download_country.html), after selecting a country.  It is ``EPSG:4326``.


#### ESPEN

* [ESPEN](https://espen.afro.who.int/)
  * [ESPEN Cartography Database](https://espen.afro.who.int/tools-resources/cartography-database)
  * [ESPEN API](https://admin.espen.afro.who.int/docs/api)
  * [ESPEN API Documentation](https://espen.stoplight.io)
  

#### Miscellaneous Features

* [features available via ``r geodata``](https://github.com/rspatial/geodata#data)
  * [population density data](https://geodata.ucdavis.edu/geodata/pop/)
* [iSDA Soil](https://www.isda-africa.com/isdasoil/)
  * [iSDA Soil Launch](https://envirometrix.nl/isdasoil-open-soil-data-for-africa/)
* [Socioeconomic Data & Applications](https://sedac.ciesin.columbia.edu/data/collection/gpw-v4/documentation)  
* [Global Colaboration Engine](http://globe.umbc.edu)
  * [GADM & GLOBE](http://globe.umbc.edu/documentation-overview/global-administrative-areas-gadm/)
  * [Variable Explorer](http://globe.umbc.edu/app/#/analysis/global-variables)
* [Spatial Data](https://www.diva-gis.org)
* [National Oceanic & Atmospheric Administration (NOAA)](https://www.ncdc.noaa.gov/cdo-web/datasets)
* [WorldClim](https://www.worldclim.org/data/index.html)
* [Map projections](https://www.usgs.gov/publications/map-projections)

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>