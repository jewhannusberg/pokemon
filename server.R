library(shinydashboard)
function(input, output) {
  
  output$primTypes <- renderPlot({
    ggplot(data = gen1, aes(Type.1)) + 
      geom_bar() +
      scale_color_brewer(type = 'div', palette = 15, direction = 1) +
      xlab('Primary Type') + ylab('Count') + 
      ggtitle('Primary Pokemon Types in Generation 1') + 
      scale_fill_manual(values = wes_palette("FantasticFox1"))

  })  
}
