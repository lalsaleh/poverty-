poverty <- function(.d){

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Poverty and Health Equity"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Parameters", icon = shiny::icon("sliders"),
                           miniUI::miniContentPanel(
                             shiny::selectInput("country", label = "Countries", multiple = TRUE,
                                 choices = countrylist, selected = countrylist[c(1,2)]),
                             shiny::sliderInput("year", label = "Years",
                                 min = 2000, max = 2018, value = c(2000,2018), step = 1),
                             shiny::selectInput("x",label="Choose x-axis", choices= series_list,
                                 selected=series_list[[2]]),
                             shiny::selectInput("y", label="Choose y-axis", choices=series_list,
                                 selected= series_list[[1]])
                   )
      ),
      miniUI::miniTabPanel("Scatter Plots", icon = shiny::icon("scatter"),
                           miniUI::miniContentPanel(
                             shiny::plotOutput("scatter", height = "100%")
                   )
      ),
      miniUI::miniTabPanel("Time Plots", icon = shiny::icon("p"),
                           miniUI::miniContentPanel(
                             shiny::plotOutput("time", height = "100%")
                   )
      )
    )
  )
  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.

    # When the Done button is clicked, return a value
    observeEvent(input$done, {
      returnValue <- ...
      stopApp(returnValue)
    })

    output$scatter <- shiny::renderPlot({
      h %>%
        filter(country %in% input$country) %>%
        filter(between(year, input$year[1],input$year[2])) %>%
        mutate(country=factor(country), year=factor(year)) %>%
        ggplot2::ggplot(ggplot2::aes(x=!!sym(input$x) ,y=!!sym(input$y), fill=country, color=country)) +
        ggplot2::geom_point( position = "dodge", stat = "summary", fun = mean)+
        ggplot2::geom_smooth(method = "lm",formula  ='y ~ x')
    })
    output$time <-shiny::renderPlot({
      h %>%
        filter(country %in% input$country) %>%
        filter(between(year, input$year[1],input$year[2])) %>%
        mutate(country=factor(country), year=factor(year)) %>%
        ggplot2::ggplot(ggplot2::aes(x=year ,y=!!sym(input$y), fill=country, color=country)) +
        ggplot2::geom_point( position = "dodge", stat = "summary", fun = mean)
    })
  }

  shiny::runGadget(ui, server)
}
