initial_map <- readRDS('data/initial_map.rds')
# load('data/initial_map.rda')
ny_vacination_center_location_sf <- readRDS('data/ny_vacination_center_location_sf.rds')

source('utils.R')

# UI ----------------------------------------------------------------------
map_page_UI <- div(
  h1('Clustering'),
  div(class="mainContainer",
      div(class="column30",
          radiobuttonsInput('address_type',
                                         label = 'You know: ',
                                         className = "blabla",
                                         valuesList = list(
                                           list(value = 'street', title = "Street name"),
                                           list(value = 'zipcode', title = "Zipcode")
                                         ),
                                         row = TRUE
          ),
          # Old Westbury Gardens
          shinyMotion::input_fieldInput('address_text_input', label = 'Street name/zipcode', helperText = 'e.g. Brooklyn or 07079', styleId = "custom1"),
          shinyMotion::action_buttonInput('generate_map', 'Show cluster', className = 'generateMapStyle')
      ),
      div(class="column70",
          # plotOutput(outputId = "distPlot"),
          leafletOutput("clusterMap", height = "43vh")
      ),
  )
)


# Server ------------------------------------------------------------------
map_page_server <- function(input, output, session) {
  # output$distPlot <- renderPlot({
  #   x    <- c(10, 20, 30,40, 50, 60)
  #   bins <- seq(min(x), max(x), length.out = 3 + 1)
  #   hist(x, breaks = bins, col = "#75AADB", border = "white",
  #        xlab = "Waiting time to next eruption (in mins)",
  #        main = "Histogram of waiting times")
  # })
  # output$clusterMap <- renderLeaflet({
  #   print(input$address_text_input)
  #
  #   initial_map@map
  # })

  # create the datasetbased on the choice of "First" or "Second"
  clusterMap <- reactiveValues(map = NULL)

  observeEvent(input$generate_map, {
    req(input$address_text_input)
    req(input$address_type)

    clusterMap$map <- input_sp_object(get_longitude_latitude(input$address_text_input, type = input$address_type))
  })

  output$clusterMap <- renderLeaflet({
    if(is.null(clusterMap$map)) {
      res_ <- initial_map@map
      return(res_)
    } else {

      #### Networks:
      network_ids <- st_nn(
        x = ny_vacination_center_location_sf,
        y = clusterMap$map,
        # k = 5,
        k = nrow(clusterMap$map),
        progress = T
      )

      network_lines_sf <- st_connect(
        x   = ny_vacination_center_location_sf,
        y   = clusterMap$map,
        ids = network_ids
      )

      nodes_tbl <- network_ids %>%
        enframe(
          name  = "location_id",
          value = "patient_id"
        ) %>%
        unnest(patient_id)

      shortest_network_sf <- network_lines_sf %>%
        st_bind_cols(nodes_tbl) %>%
        mutate(len = st_length(geometry)) %>%
        relocate(len, .after = patient_id) %>%

        group_by(patient_id) %>%
        filter(len == min(len)) %>%
        ungroup()

      res_ <- (
          initial_map +
          mapview(
            layer.name = "Recommendation",
            clusterMap$map,
            cex = 12
          ) +
          mapview(
            shortest_network_sf$geometry,
            color      = "pink"
          )
        )@map

      return(res_)
    }

  })

}
