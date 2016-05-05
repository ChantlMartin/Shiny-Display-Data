library(shiny)

bank_orig <- read.csv("./data/bank_orig.csv")
bank4 <- read.csv("./data/bank4.csv")

ui <- fluidPage(
  titlePanel(h4("The Cleaning Process", align = "center")), 
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Select The Data Set", choices = c("Original", "Final"))
      
    ),
    mainPanel(
    
      tableOutput("table")
    )
  )
)
 
server <- function(input, output) {
  datasetInput <- reactive ({
    switch(input$dataset, 
           "Original" = head(bank_orig), "Final" = head(bank4))
  })
    
  fileext <- reactive({
    switch(input$type, 
           "Excel (CSV)" = "csv", "Text (TSV)" = "txt", "Text (Space Separated)" = "txt")
  })
  output$table <- renderTable({
    datasetInput()
  })
}
  
  
  
shinyApp(ui = ui, server = server)
  