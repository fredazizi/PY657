fluidPage(
  titlePanel("Correlation and Scatterplot"),
  sidebarLayout(
    sidebarPanel(
      
      fileInput("upload", "Upload", accept = ".tar", multiple = T),
      
      selectInput("variable1", "Variable1:",
                  c("cortical (gray matter) volumes of the primary visual area" = "Pole_occipital",
                    "volume of precentral gyrus" = "G_precentral",
                    "cortical volumes of the hippocampus" = "G_temporal_middle",
                    "volume of prefrontal cortex"="G_front_sup")),
      selectInput("variable2", "Variable2:",
                  c("cortical (gray matter) volumes of the primary visual area" = "Pole_occipital",
                    "volume of precentral gyrus" = "G_precentral",
                    "cortical volumes of the hippocampus" = "G_temporal_middle",
                    "volume of prefrontal cortex"="G_front_sup")),
      br(),
      actionButton("process", "Process uploaded data")
    ),
    mainPanel(
      tableOutput("sum"),
      plotOutput("plot1")
      #verbatimTextOutput("b"),
      #verbatimTextOutput("c")
      
    )
  )# this is for sidebar
)