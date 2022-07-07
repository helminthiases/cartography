<br>

Development Notes

<br>

### Snippets

```R

# IHME LMIC WASH Estimates 2000 - 2017 Administration Level 2 Piped Sanitation Y2020M06D02
# Access to sewer and septic sanitation facilities [GeoTIFF]

# records
url <- paste0('https://cloud.ihme.washington.edu/s/bkH2X2tFQMejMxy?path=%2FData%20%5BCSV%5D%2FAdmin%202&',
              'files=IHME_LMIC_WASH_2000_2017_S_PIPED_ADMIN_2_Y2020M06D02.zip')
records <- data.table::fread(file = uri, strip.white = TRUE)
str(records)

# The number of unique countries
length(x = unique(records$ADM0_CODE))
```

<br>

```R
root <- glue::glue('{endpoint}path={path}&files')
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

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>