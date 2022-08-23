library(shiny)
library(shinyMotion)
library(leaflet)
library(mapview)
library(shiny.router)
library(shinyjs)
library(osmdata)    # Open Street Map Overpass API
library(osrm)       # Open Street Map Routing API

library(sf)         # Simple Features
library(nngeo)      # Nearest Neighbors
library(mapview)    # Interactive Maps

library(tidygeocoder) # GEOCODING
library(tigris)       # GET SHAPE FILES FOR UNITED STATES

library(tidyverse)  # Core tidy libs




# load('data/initial_map.rda')
source('pages/map_page.R')
source('pages/plot_page.R')

# Router ----
router <- make_router(
  route("/", map_page_UI, map_page_server),
  route("plot", plot_page_UI, plot_page_server)
)

# UI ----
ui <- div(

    # Enable JS
    useShinyjs(),
    # Application dependencies
    tags$head(
      tags$title('Epi dashboard'),
      tags$script(src = 'shiny.router.js'),
      tags$link(href = "shiny.router.css", rel = "stylesheet", type = "text/css"),
      tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
      tags$link(href = "HomeButton-0.0.1/HomeButton-0.0.1.css", rel = "stylesheet", type = "text/css"),
      tags$script(src = 'Proj4Leaflet-1.0.1/proj4leaflet.js'),
      tags$link(href = "leaflet-1.3.1/leaflet.css", rel = "stylesheet", type = "text/css"),
      tags$script(src = 'leaflet-1.3.1/leaflet.js'),
      tags$script(src = 'leaflet-binding-2.0.4.1/leaflet.js'),
      tags$script(src = 'proj4-2.6.2/proj4.min.js'),
      tags$link(href = "leafletfix-1.0.0./leafletfix.css", rel = "stylesheet", type = "text/css"),
      tags$link(href = "rstudio_leaflet-1.3.1/rstudio_leaflet.css", rel = "stylesheet", type = "text/css"),

    ),
    # Template begins here
    shinyMotion::MotionTemplate(
      navigation = list(
                      list(title = 'Clustering', routeLink = route_link("/"), color = '#fdac02'),
                      list(title = 'Time Series', routeLink = route_link("plot"), color = '#575655')
                   ),
      maincontet = shinyMotion::mainContent(
                      router$ui
                   )
    )

)


server <- function(input, output, session) {


  router$server(input, output, session)


}

shinyApp(ui, server)
