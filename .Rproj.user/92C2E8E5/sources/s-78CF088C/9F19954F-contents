#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
radiobuttonsInput <- function(
  inputId,
  label,
  className = "",
  valuesList,
  row = FALSE
  ) {
  reactR::createReactShinyInput(
    inputId,
    "radiobuttons",
    htmltools::htmlDependency(
      name = "radiobuttons-input",
      version = "1.0.0",
      src = "www/shinyMotion/radiobuttons",
      package = "shinyMotion",
      script = "MotionTemplate.js"
    ),
    default = NULL,
    list(
      label = label,
      className = className,
      valuesList = valuesList,
      row = row
    ),
    htmltools::tags$span
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateRadiobuttonsInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
