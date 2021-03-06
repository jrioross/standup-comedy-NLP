library(tidyverse)
library(shiny)
library(shinydashboard)
library(shinythemes)
library(fresh)
library(shinyjs)
library(DT)
library(shinyDataFilter)
library(plotly)
library(patchwork)
library(shinycssloaders)
library(shinymaterial)
library(ggcorrplot)
library(heatmaply)
library(lubridate)
library(DBI)
library(RSQLite)
library(rsconnect)

# Get data from sqlite database
con <- dbConnect(RSQLite::SQLite(), "data/metacosims_recommender.sqlite")
query <- "SELECT * FROM metacosims;"
res <- dbSendQuery(con, query)
overallfull <- dbFetch(res)
dbDisconnect(con)

# Create list of unique shows
showList <- overallfull %>% 
  select(`fullTitle selection`) %>%
  unique() %>% 
  arrange(`fullTitle selection`) %>% 
  pull()

randomInt <- sample(1:length(showList), 1)
randomShow <- showList[randomInt]

# Create function to get recommendations
recommend <- function(newArtistsOnly = FALSE, selectedShow){
  
  if(newArtistsOnly){
    
    filteredoverall <- overallfull %>% 
      filter(
        (`fullTitle selection` == selectedShow)
        &
        (`artist selection` != `artist comparison`)
      )
    
    self <- overallfull %>% 
      filter(`fullTitle selection` == selectedShow) %>% 
      slice_max(`mean similarity`, n = 1)
    
    top5 <- filteredoverall %>% 
      slice_max(`mean similarity`, n = 5)
    
    bottom1 <- filteredoverall %>% 
      slice_min(`mean similarity`, n = 1)
    
    recs <- self %>% bind_rows(top5) %>% bind_rows(bottom1)
    
    return(recs)
    
    
  } else {
    
    filteredoverall <- overallfull %>% 
      filter(`fullTitle selection` == selectedShow) %>% 
      filter(`mean similarity` < 0.98)
    
    self <- overallfull %>%
      filter(`fullTitle selection` == selectedShow) %>%
      slice_max(`mean similarity`, n = 1)
    
    top5 <- filteredoverall %>% 
      slice_max(`mean similarity`, n = 5)
    
    bottom1 <- filteredoverall %>% 
      slice_min(`mean similarity`, n = 1)
    
    recs <- self %>% bind_rows(top5) %>% bind_rows(bottom1)
    
    # recs <- top5 %>% bind_rows(bottom1)
    
    return(recs)
    
  }
}

# image widths and heights

selImageScaler = 1.6
imgScaler = 1

selWidth = 100
selHeight = 160
recWidth = 100
recHeight = 160