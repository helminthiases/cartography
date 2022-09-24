<br>

[Geospatial Variables](#geospatial-variables)
 * [WaSH](#wash)
 * [Elevation](#elevation)
 * [Population Density](#population-density)

[The Programs](#the-programs)


<br>
<br>

## Geospatial Variables

<br>

Each observation of an ESPEN (Expanded Special Project for the Elimination of Neglected Tropical Diseases) 
<i><span title="soil transmitted helminths (STH)">geohelminths</span> infections survey experiments</i> data 
set - the data set of a country across years - includes the variables

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

and much more. &nbsp; Due to the presence of the latitude & longitude values, we can extract feature value estimates from 
geospatial variable objects. &nbsp; Hence, the focus herein is the derivation of features estimates of interest, per location 
within a STH ESPEN data set. &nbsp; Initially, the features of interest are 

* WaSH (water, sanitation, and hygiene) features.
* Population density.
* Elevation.

Future options include _land surface temperature_ and _enhanced vegetation index_.

<br>
<br>

### WaSH

The WaSH (water, sanitation, and hygiene) data maps are courtesy of the Institute for Health Metrics and Evaluation (IHME). &nbsp;  Its 
[WaSH features maps collection](https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy) are for the years [2000 &nbsp; 2017]; 
[details](https://www.healthdata.org/research-article/mapping-geographic-inequalities-access-drinking-water-and-sanitation-facilities-low).

<br>
<br>

### Elevation

The list below summarises a set of [World Climate](https://worldclim.org/data/worldclim21.html) elevations maps. &nbsp; The maps are
derivations/versions of the  [Shuttle Radar Topography Mission's](https://lpdaac.usgs.gov/products/srtmgl1v003/) elevation
maps. &nbsp; In terms of the Soil Transmitted Helminths Project, the elevation values per location are extracts of the **30 seconds map**.

* [30 seconds](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_elev.zip)
* [2.5 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_2.5m_elev.zip)
* [5 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_5m_elev.zip)
* [10 minutes](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_10m_elev.zip)

The Shuttle Radar Topography Mission (SRTM) maps are explorable via  [earth explorer](https://earthexplorer.usgs.gov); 
try [Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global data/map](https://earthexplorer.usgs.gov).

<br>
<br>

### Population Density

The population data is courtesy of the [Socioeconomic Data & Applications](https://sedac.ciesin.columbia.edu/data/collection/gpw-v4/documentation) centre. &nbsp; For its 
population maps collection details visit [Gridded Population of the World (GPW), v4](https://sedac.ciesin.columbia.edu/data/collection/gpw-v4/whatsnew). &nbsp; The 
maps are accessible via the ``r`` library [`geodata`](https://github.com/rspatial/geodata#data). &nbsp; Additionally, the University of California, Davis, stores copies of these 
map: [population density data](https://geodata.ucdavis.edu/geodata/pop/).

<br>
<br>

## The Programs

The table below outlines the programs of this repository.  The programs extend/enhance a set of the experiments' data of
the [infections repository](https://github.com/helminthiases/infections).  The statement/command

````r
  source(file = 'R/main.R')
````

runs all the repository's programs.  Subsequently, the enhanced data sets are interactively explorable
via <a href="https://helminthiases.github.io/exploration" target="_blank">Tableau Public</a>.

<br>

<table style="width: 65%; font-size: 65%; text-align: left; margin-left: 65px;">
    <colgroup>
        <col span="1" style="width: 30%;">
        <col span="1" style="width: 65%;">
    </colgroup>
    <thead>
        <tr><th>action</th><th>comment</th></tr>
    </thead>
    <tr>
        <td><ul>
            <li><a href=".R/src/experiments/interface.R">R/src/experiments/interface.R</a></li>
            <li><a href=".R/src/WASH/interface.R">R/src/WASH/interface.R</a></li>
            <li><a href=".R/src/population/interface.R">R/src/population/interface.R</a></li>
            <li><a href=".R/src/elevation/interface.R">R/src/elevation/interface.R</a></li>
        </ul></td>
        <td>These programs unload the experiments, WaSH, populations, and elevation data/maps via URL strings.  <br><br>The experiments data depends 
            on this project's <a href="https://github.com/helminthiases/infections" target="_blank">infections repository</a>. &nbsp; Specifically, a set of its 
            <a href="https://raw.githubusercontent.com/helminthiases/infections/master/warehouse/data/ESPEN/experiments/data.csv">outcomes</a>; a 
            data set/file per country. <br><br></td>
    </tr>
    <tr>
        <td><ul><li><a href=".R/features/experiments/interface.R">R/features/experiments/interface.R</a></li></ul><br></td>
        <td>Delivers a copy of each experiment data set/file to the outcomes directory; <a href="./warehouse/features/data">warehouse/features/data</a>.<br><br></td>
    </tr>
    <tr>
        <td><ul>
            <li><a href=".R/features/WASH/interface.R">R/features/WASH/interface.R</a></li>
            <li><a href=".R/features/population/interface.R">R/features/population/interface.R</a></li>
            <li><a href=".R/features/elevation/interface.R">R/features/elevation/interface.R</a></li>
        </ul><br></td>
        <td>Each of these programs enhance the data sets of the outcomes directory <a href="./warehouse/features/data">warehouse/features/data</a>.  They 
        add WaSH, population, and elevation features to each data set/file via each file's longitude & latitude values.<br><br></td>
    </tr>
</table>

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>