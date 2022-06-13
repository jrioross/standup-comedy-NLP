# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("slate"),

    # Application title
    titlePanel("Standup for Yourself Comedy Recommender"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          selectInput("selectedShow",
                      "Select a Show",
                      showList,
                      selected = randomShow),
          checkboxInput("newArtistsOnly",
                        "Different Artists Than Selected",
                        FALSE),
          width = 2
        ),

        # Show a plot of the generated distribution
        mainPanel(
          fluidRow(
            column(
              width = 3,
              htmlOutput("sel_text"),
              #style = paste0("border: 2px solid", ktcPalette['ktcBlue']),
              htmlOutput("sel_img")
            ),
            column(
              width = 9,
              fluidRow(
                column(
                  width = 4,
                  htmlOutput("rec1_text"),
                  style = paste0("border: 2px solid #0C7C59"),
                  htmlOutput("rec1_img")
                ),
                column(
                  width = 4,
                  htmlOutput("rec2_text"),
                  #style = paste0("border: 2px solid", ktcPalette['ktcDarkRed']),
                  htmlOutput("rec2_img")
                ),
                column(
                  width = 4,
                  htmlOutput("rec3_text"),
                  #style = paste0("border: 2px solid", ktcPalette['ktcDarkRed']),
                  htmlOutput("rec3_img")
              ),
            ),
              fluidRow(
                column(
                  width = 4,
                  htmlOutput("rec4_text"),
                  #style = paste0("border: 2px solid", ktcPalette['ktcDarkRed']),
                  htmlOutput("rec4_img")
                ),
                column(
                  width = 4,
                  htmlOutput("rec5_text"),
                  #style = paste0("border: 2px solid", ktcPalette['ktcDarkRed']),
                  htmlOutput("rec5_img")
                ),
                column(
                  width = 4,
                  htmlOutput("rec6_text"),
                  style = paste0("border: 2px solid #D64933"),
                  htmlOutput("rec6_img")
                )
              )
            )
          )
        )
    )
    
))
