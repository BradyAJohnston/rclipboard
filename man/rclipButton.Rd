\name{rclipButton}
\alias{rclipButton}
\alias{rclipLink}
\title{Action button or action link to send information to clipboard}
\description{Creates an action button or link that will send user-defined text to the OS clipboard.}
\usage{
rclipButton(inputId, label, clipText, modal = FALSE, ...)
rclipLink(inputId, label, clipText, modal = FALSE, ...)
}
\arguments{
  \item{inputId}{The \code{input} slot that will be used to access the value.}
  \item{label}{The contents of the button or link--usually a text label, but
  you could also use any other HTML, like an image.}
  \item{clipText}{A single scalar character variable to be sent to the clipboard.}
  \item{modal}{A logical flag indicating whether the button will be shown in a
    modal window (TRUE) or not (NOT).}
  \item{...}{Additional arguments (e.g. \code{icon} or \code{width}) passed down 
  to \code{\link[shiny]{actionButton}} or \code{\link[shiny]{actionLink}}.}
}
\references{
https://clipboardjs.com/
}
\seealso{
  \code{\link{rclipboardSetup}}
}
\author{
  Sebastien Bihorel
}
\examples{
## Not run
\dontrun{
library(rclipboard)
library(shiny)

# The UI
ui <- bootstrapPage(
  
  rclipboardSetup(),
  
  # Add a text input
  textInput("copytext", "Copy this:", "Zlika!"),

  # UI ouputs for the copy-to-clipboard buttons
  uiOutput("clip"),
  
  # A text input for testing the clipboard content.
  textInput("paste", "Paste here:")
  
)

# The server
server <- function(input, output) {

  # Add clipboard buttons
  output$clip <- renderUI({
    rclipButton("clipbtn", "rclipButton Copy", input$copytext, icon("clipboard"))
  })
  
}

shinyApp(ui = ui, server = server)
}
}
