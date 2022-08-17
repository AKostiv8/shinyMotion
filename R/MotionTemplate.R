#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
MotionTemplate <- function(navigation = NULL,
                           maincontet,
                           width = '100%',
                           height = '100%',
                           elementId = NULL,
                           ...
                           ) {
  # describe a React component to send to the browser for rendering.
  # component <- reactR::reactMarkup(htmltools::tag("div", list(message)))
  # print(navigation)
  # print(maincontet)
  component <- reactR::reactMarkup(reactR::component("MotionContainer", list(...,
                                                                             maincontet = as.character(maincontet),
                                                                               menuData = navigation
                                                                             )
                                                     )
                                   )

  # create widget
  htmlwidgets::createWidget(
    name = 'MotionTemplate',
    component,
    width = width,
    height = height,
    package = 'shinyMotion',
    elementId = elementId
  )
}

#' @export
mainContent <- function(...) {
  tagList(
    div(class="MainContent",
      ...
    )
  )
}


#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.MotionTemplate <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for MotionTemplate
#'
#' Output and render functions for using MotionTemplate within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a MotionTemplate
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name MotionTemplate-shiny
#'
#' @export
MotionTemplateOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'MotionTemplate', width, height, package = 'shinyMotion')
}

#' @rdname MotionTemplate-shiny
#' @export
renderMotionTemplate <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, MotionTemplateOutput, env, quoted = TRUE)
}
