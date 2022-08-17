#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
contentContainer <- function(..., width = NULL, height = NULL, elementId = NULL) {

  # describe a React component to send to the browser for rendering.
  # component <- reactR::reactMarkup(htmltools::tag("div", list(...)))
  component <- reactR::reactMarkup(reactR::component("MainContent", list(...)))

  # create widget
  htmlwidgets::createWidget(
    name = 'contentContainer',
    component,
    width = width,
    height = height,
    package = 'shinyMotion',
    elementId = elementId
  )
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.contentContainer <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for contentContainer
#'
#' Output and render functions for using contentContainer within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a contentContainer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name contentContainer-shiny
#'
#' @export
contentContainerOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'contentContainer', width, height, package = 'shinyMotion')
}

#' @rdname contentContainer-shiny
#' @export
renderContentContainer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, contentContainerOutput, env, quoted = TRUE)
}
