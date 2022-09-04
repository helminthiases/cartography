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
within a STH ESPEN data set.  Initially, the features of interest are 

* WASH (water, sanitation, and hygiene) features.
* Population density.
* Elevation.

Future options include _land surface temperature_ and _enhanced vegetation index_.

<br>
<br>

### About Elevation

The list below summarises a set of [World Climate](https://worldclim.org/data/worldclim21.html) elevations maps.  The maps are
derivations/versions of the  [Shuttle Radar Topography Mission's](https://lpdaac.usgs.gov/products/srtmgl1v003/) elevation
maps.  In terms of the Soil Transmitted Helminths Project, elevation values per location are extracts from the **30 seconds map**.

* [30 seconds](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_elev.zip)
* [2.5 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_2.5m_elev.zip)
* [5 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_5m_elev.zip)
* [10 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_10m_elev.zip)

The Shuttle Radar Topography Mission (SRTM) _earth explorer_ is undergoing redevelopment, re-visit and unload
the [Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global data/map](https://earthexplorer.usgs.gov).


<br>
<br>

### References

* [IHME WASH](https://www.healthdata.org/research-article/mapping-geographic-inequalities-access-drinking-water-and-sanitation-facilities-low)

Elevation
* [Open Topology & SRTM](https://www.opentopodata.org/datasets/srtm/)
* [SRTM](https://lpdaac.usgs.gov/products/srtmgl1v003/),
* [USGS Elevation](https://www.usgs.gov/centers/eros/science/usgs-eros-archive-digital-elevation-shuttle-radar-topography-mission-srtm-1?qt-science_center_objects=0#qt-science_center_objects)


* [Global Administrative Areas (GADM)](https://gadm.org)
  * The co&ouml;rdinate reference system details of a GADM map are visible at the bottom 
    of [a country page](https://gadm.org/download_country.html), after selecting a country.  It is ``EPSG:4326``.
  * [Global Colaboration Engine](http://globe.umbc.edu)
  * [GADM & GLOBE](http://globe.umbc.edu/documentation-overview/global-administrative-areas-gadm/)
  * [Variable Explorer](http://globe.umbc.edu/app/#/analysis/global-variables)  
  
* [Features available via ``r geodata``](https://github.com/rspatial/geodata#data)
  * [population density data](https://geodata.ucdavis.edu/geodata/pop/)
  * [population density data details](https://sedac.ciesin.columbia.edu/data/collection/gpw-v4/whatsnew)
  * [Socioeconomic Data & Applications](https://sedac.ciesin.columbia.edu/data/collection/gpw-v4/documentation)

* [iSDA Soil](https://www.isda-africa.com/isdasoil/)
  * [iSDA Soil Launch](https://envirometrix.nl/isdasoil-open-soil-data-for-africa/)
  
* [DIVA GIS Spatial Data](https://www.diva-gis.org/Data)
  
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