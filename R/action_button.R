#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#' @import htmlwidgets
#' @import mapview
#' @import leaflet
#'
#' @export
action_buttonInput <- function(
  inputId,
  label,
  variant = c('text', 'contained', 'outlined'),
  color = c("default", "primary", "secondary"),
  size = c("medium", "small", "large"),
  disabled = FALSE,
  className = ""
) {

  color <- match.arg(color)
  size <- match.arg(size)

  reactR::createReactShinyInput(
    inputId,
    "action_button",
    htmltools::htmlDependency(
      name = "action_button-input",
      version = "1.0.0",
      src = "www/shinyMotion/action_button",
      package = "shinyMotion",
      script = "MotionTemplate.js"
    ),
    default = NULL,
    configuration = list(
      label = label,
      variant = variant,
      color = color,
      disabled = disabled,
      size = size,
      className = className
    ),
    htmltools::tags$span
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateAction_buttonInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
