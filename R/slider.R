#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
sliderInput <- function(inputId, defaultValue = 30, min = 0, max = 100) {
  reactR::createReactShinyInput(
    inputId,
    "slider",
    htmltools::htmlDependency(
      name = "slider-input",
      version = "1.0.0",
      src = "www/shinyMotion/slider",
      package = "shinyMotion",
      script = "MotionTemplate.js"
    ),
    default = NULL,
    list(
      defaultValue = defaultValue,
      min = min,
      max = max
    ),
    htmltools::tags$span
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateSliderInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
