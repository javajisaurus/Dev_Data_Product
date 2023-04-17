#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

server <- function(input, output) {
  
  ball_movement <- reactive({
    t <- seq(0, 5, 0.01)
    a <- input$angle * pi / 180
    v0 <- input$velocity
    x <- v0 * cos(a) * t
    y <- v0 * sin(a) * t - 0.5 * 9.8 * t^2
    if (input$friction) {
      y[y < 0] <- 0
      v <- sqrt((v0 * cos(a))^2 + (2 * 9.8 * y))
      x <- x + cumsum(v * 0.01)
    }
    data.frame(x = x, y = y)
  })
  
  output$plot <- renderPlot({
    plot(ball_movement()$x, ball_movement()$y, type = "l", xlab = "distance (m)", ylab = "High (m)", ylim = c(0, max(ball_movement()$y)))
  })
  output$nilai_maks <- renderText({
    max(ball_movement()$y)
  })
  output$nilai_min <- renderText({
    min(ball_movement()$y)
  })
  output$info_gesekan <- renderText({
    if (input$friction_ == "yes") {
      "Friction"
    } else {
      "Frictionless"
    }
  })
  
  

}