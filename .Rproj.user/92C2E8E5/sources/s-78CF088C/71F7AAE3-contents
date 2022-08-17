#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
select_inputInput <- function(inputId) {
  reactR::createReactShinyInput(
    inputId,
    "select_input",
    htmltools::htmlDependency(
      name = "select_input-input",
      version = "1.0.0",
      src = "www/shinyMotion/select_input",
      package = "shinyMotion",
      script = "MotionTemplate.js"
    ),
    default = NULL,
    list(),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateSelect_inputInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
