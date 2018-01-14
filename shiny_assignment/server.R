#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(VennDiagram)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$out1 <- renderText(input$caption)
  output$VennPlot <- renderPlot({
    
    #split list names
    ua<-unlist(strsplit(input$a,split='\\W'))
    ub<-unlist(strsplit(input$b,split='\\W'))
    uc<-unlist(strsplit(input$c,split='\\W'))
    ud<-unlist(strsplit(input$d,split='\\W'))
    
    # draw the venn diagram with the specified number of groups
    if(input$num==2){
      draw.pairwise.venn(length(ua), length(ub), length(intersect(ua,ub)), 
                         category = c(input$l1,input$l2), 
                         lty = rep("blank", 2), 
                         fill = c("light blue", "pink"), 
                         alpha = rep(0.5, 2), 
                         cat.pos = c(0, 0), 
                         cat.dist = rep(0.025, 2))
    }else if(input$num==3){
      draw.triple.venn(length(ua), length(ub), length(uc), 
                       n12=length(intersect(ua,ub)), 
                       n23=length(intersect(ub,uc)),
                       n13=length(intersect(ua,uc)),
                       n123=length(intersect(intersect(ua,ub),uc)),
                       category = c(input$l1,input$l2,input$l3), lty = "blank", 
                       fill = c("skyblue", "pink1", "mediumorchid"))
    }else if(input$num==4){
      draw.quad.venn( length(ua), length(ub), length(uc), length(ud), 
                      n12=length(intersect(ua,ub)), 
                      n13=length(intersect(ua,uc)),
                      n14=length(intersect(ua,ud)), 
                      n23=length(intersect(ub,uc)),
                      n24=length(intersect(ub,ud)), 
                      n34=length(intersect(uc,ud)), 
                      n123=length(intersect(intersect(ua,ub),uc)),
                      n124=length(intersect(intersect(ua,ub),ud)),
                      n134=length(intersect(intersect(ua,uc),ud)),
                      n234=length(intersect(intersect(ub,uc),ud)), 
                      n1234=length(intersect(intersect(ua,ub),intersect(uc,ud))),
                      category = c(input$l1,input$l2,input$l3,input$l4),
                      lty = "blank", fill = c("skyblue", "pink1", "mediumorchid", "orange")
                      
      )
    }
    
  
  })
  
})
