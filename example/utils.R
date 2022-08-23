# get_longitude_latitude function ----
get_longitude_latitude <- function(location, type = c('street, zipcode')) {

  tbl <- tibble(
    location_id = 0,
    OBJECTID = 0,
    patient_id = 0,
    Type = location,
  )

  message(type)

  if(type == 'street') {
    res <- tbl %>%
      geocode(
        street = Type
      )
  }

  if(type == 'zipcode') {
    res <- tbl %>%
      geocode(
        postalcode = Type
      )
  }

  return(res)

}

# Convert to sp object function -----
input_sp_object <- function(in_tbl) {

  in_tbl %>%
    st_as_sf(
      coords = c("long", "lat"),
      crs    = 4326
    )

}
