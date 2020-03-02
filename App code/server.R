library(ggplot2)
library(utils)
library(shiny)
function(input, output) {
  observeEvent(input$process, {
    n<-length(input$upload$datapath)
    untar(input$upload$datapath[1], files = "lh.cortex.csv")  
    lh<-read.csv("lh.cortex.csv")
    file.remove("lh.cortex.csv")  
    for (i in 2:n) {
      untar(input$upload$datapath[i], files = "lh.cortex.csv")  
      lh<-rbind(lh,read.csv("lh.cortex.csv"))
      file.remove("lh.cortex.csv")  
    }
    v1<-lh$gray_matter_volume_mm.3[which(lh$structure_name==input$variable1)]
    v2<-lh$gray_matter_volume_mm.3[which(lh$structure_name==input$variable2)]
    c<-data.frame( correlation=cor(v1,v2))
    p<-data.frame(v1=v1,v2=v2)
    
    output$sum <- renderTable(c)
    output$plot1 <- renderPlot({
      ggplot(p, aes(x=v1, y=v2))+
        geom_point()+
        theme_bw()+
        labs(x=input$variable1, y=input$variable2)+
        geom_smooth(method = "lm")
    })
    #output$c<-renderPrint(input$files)
    
  })
}