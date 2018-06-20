library(shinydashboard)

function(input, output) {
  # strengths_weaknesses_graph <- function(pkmn, df){
  #   
  # }
  
  # keep only the selected pokemon in the dataframe
  selectedData <- reactive({
    gen1[gen1$Name %in% selected_pokemon, ] 
  })
  
  
  
  output$summary <- renderTable(
    selectedData
  )
  
  output$types_matrix <- renderPlot({
    ggplot(types_mat, aes(x = types_mat[, 2],y = types_mat[, 1], fill = types_mat[, 3])) + 
      geom_tile() + 
      scale_fill_manual(values = c('black', 'red','gray', "green")) +
      labs(x = "Defense Type \n", y = "Attack Type \n", 
           title = "Pokemon Type Chart", fill = "Attack Damage Multiplier \n") + 
      theme(plot.title = element_text(hjust = 0.5), 
            axis.title.x = element_text(face="bold", colour="#FF7A33", size = 12),
            axis.title.y = element_text(face="bold", colour="#FF7A33", size = 12),
            axis.text.x = element_text(angle = 90,vjust = 0.2, hjust = 1),
            legend.title = element_text(face="bold", size = 10)) +
      scale_x_discrete(position = "top")
  })  
  selected_pokemon <- c(input$pkmn1, input$pkmn2, input$pkmn3, input$pkmn4, input$pkmn5, input$pkmn6)
  
  
}
