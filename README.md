<br>

**Cartography**

<br>

### Notes

The foci herein are project maps, and map derived estimates.  For site level estimates &rarr;

* Read-in the Administration Level 2 shapes
* Extract the co&ouml;rdinates per administration area
* Create a raster map of a feature via administration area co&ouml;rdinates & administration area feature values
* Extract site level values from the raster.

<br>

References of interest:

* [ESPEN Cartography Database](https://espen.afro.who.int/tools-resources/cartography-database)
* [Spatial Data](https://www.diva-gis.org)

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
