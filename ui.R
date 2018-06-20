pageWithSidebar(
  headerPanel('Pokemon Team Builder'),
  sidebarPanel(
    
    selectInput("pkmn1", "Pokemon 1", choices = names, selected = names[1]),
    selectInput("pkmn2", "Pokemon 2", choices = names, selected = names[12]),
    selectInput("pkmn3", "Pokemon 3", choices = names, selected = names[44]),
    selectInput("pkmn4", "Pokemon 4", choices = names, selected = names[37]),
    selectInput("pkmn5", "Pokemon 5", choices = names, selected = names[80]),
    selectInput("pkmn6", "Pokemon 6", choices = names, selected = names[101])
  ),
  
  mainPanel(
    # include an image
    # tags$img(src='99.png', height=60, width=60), 
    # include a plot
    tableOutput("summary"),
    plotOutput("types_matrix")
    
  )
)


