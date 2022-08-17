#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
input_fieldInput <- function(
  inputId,
  label,
  value = NULL,
  helperText = "",
  styleId = ""
  ) {
  reactR::createReactShinyInput(
    inputId,
    "input_field",
    htmltools::htmlDependency(
      name = "input_field-input",
      version = "1.0.0",
      src = "www/shinyMotion/input_field",
      package = "shinyMotion",
      script = "MotionTemplate.js"
    ),
    default = NULL,
    configuration = list(
      label = label,
      value = value,
      helperText = helperText,
      styleId = styleId
    ),
    htmltools::tags$span
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateInput_fieldInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
