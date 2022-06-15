# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
    # run recommend function based upon user inputs
    recs <- reactive({

      recommend(input$newArtistsOnly, input$selectedShow)  
      
    })
    
    # retrieve image for selected show
    output$sel_img <- renderUI({
      
      src <- recs() %>%
        slice(1) %>% 
        select(`image selection`)
      
      tags$img(src = src, width = selImageScaler*imgScaler*selWidth, height = selImageScaler*imgScaler*selHeight)
      
    })
    
    # retrieve text for selected show
    output$sel_text <- renderText({
      
      line <- recs() %>% 
        slice(1) 
      
      paste0("<b>", line %>% select(`fullTitle selection`), "</b>"
             #"<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
             )
      
    })
    
    # retrieve image for recommendation 1
    output$rec1_img <- renderUI({
      
      src <- recs() %>%
        slice(2) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })

    # retrieve text for recommendation 1
    output$rec1_text <- renderText({
      
      line <- recs() %>% 
        slice(2) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
    
    # retrieve image for recommendation 2
    output$rec2_img <- renderUI({
      
      src <- recs() %>%
        slice(3) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })
    
    # retrieve text for recommendation 2
    output$rec2_text <- renderText({
      
      line <- recs() %>% 
        slice(3) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
    
    # retrieve image for recommendation 3
    output$rec3_img <- renderUI({
      
      src <- recs() %>%
        slice(4) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })
    
    # retrieve text for recommendation 3
    output$rec3_text <- renderText({
      
      line <- recs() %>% 
        slice(4) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
    
    # retrieve image for recommendation 4
    output$rec4_img <- renderUI({
      
      src <- recs() %>%
        slice(5) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })
    
    # retrieve text for recommendation 4
    output$rec4_text <- renderText({
      
      line <- recs() %>% 
        slice(5) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
    
    # retrieve image for recommendation 5
    output$rec5_img <- renderUI({
      
      src <- recs() %>%
        slice(6) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })
    
    # retrieve text for recommendation 5
    output$rec5_text <- renderText({
      
      line <- recs() %>% 
        slice(6) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
    
    # retrieve image for recommendation 6
    output$rec6_img <- renderUI({
      
      src <- recs() %>%
        slice(7) %>% 
        select(`image comparison`)
      
      tags$img(src = src, width = imgScaler*recWidth, height = imgScaler*recHeight)
      
    })
    
    # retrieve text for recommendation 6
    output$rec6_text <- renderText({
      
      line <- recs() %>% 
        slice(7) 
      
      paste0("<b>", line %>% select(`fullTitle comparison`), "</b>",
             "<br>Similarity: ", line %>% select(`mean similarity`) %>% round(3)
             # "<br>Team: ", fcontent %>% select(recent_team),
             # "<br>Age: ", dcontent %>% select(Age) %>% unique(),
             # "<br>Experience: ", dcontent %>% select(Experience) %>% unique(),
             # "<br>Height: ", dcontent %>% select(Height) %>% unique(),
             # "<br>Weight: ", dcontent %>% select(Weight) %>% unique(),
             # "<br><br><br><br><br><br>"
      )
      
    })
  
})
