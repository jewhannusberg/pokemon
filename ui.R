fluidPage(
  titlePanel('Strengths/Weaknesses Graph'),
  mainPanel(
    # include an image
    # tags$img(src='99.png', height=60, width=60), 
    # include a plot
    plotOutput("types_matrix")
    
  )
)


